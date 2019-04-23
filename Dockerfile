# ALPINE APACHE 2 FANCY
#
# VERSION: 1.1

FROM alpine:latest
LABEL maintener "Ruben D. Carrera <@rdcarrera>"
LABEL version 1.1

#ENV Variables
ENV FANCY_FOLDER="/fancy/mount" \
FANCY_DISABLE_FOOTER="no" \
DOCKER_EXPOSE_PORT="8080" \
DOCKER_WORKDIR="/fancy" \
DOCKER_USER=apache

#MOUNT VOLUME
VOLUME [ "${FANCY_FOLDER}" ]

#Install the apache2 & apache2-ctl
RUN apk add --update apache2 apache2-ctl && \
rm -rf /var/www/localhost/htdocs && \
chmod 777 /run/apache2 && \
ln -s $FANCY_FOLDER /var/www/localhost/htdocs

#Expose the port 80
EXPOSE ${DOCKER_EXPOSE_PORT}

#Copy the folder from the project
ADD fancy.tar.xz /

#Copy docker entrypoint
COPY ./docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh && \
chmod -R 777 ${DOCKER_WORKDIR}/html

#User apache user
USER $DOCKER_USER

#WORKDIR 
WORKDIR $DOCKER_WORKDIR

#Definie entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

#Execute the apache2
CMD ["/usr/sbin/apachectl", "-f" , "/fancy/cnf/apache2.conf",  "-D", "FOREGROUND"]
