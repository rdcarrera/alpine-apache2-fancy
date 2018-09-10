# ALPINE APACHE 2 FANCY
#
# VERSION: 1

FROM alpine:latest
LABEL maintener "Ruben D. Carrera <@rdcarrera>"
LABEL version 1.0

#ENV Variables
ENV FANCY_FOLDER /fancy/mount

#Install the apache2 & apache2-ctl
RUN apk add --update apache2 apache2-ctl

#Create apache2 run folder
RUN mkdir /run/apache2

#ADD 777 perms to the folder apache2 run
RUN chmod 777 /run/apache2

#Remove apache folder
RUN rm -rf /var/www/localhost/htdocs

#Mount FANCY_FOLDER
RUN ln -s $FANCY_FOLDER /var/www/localhost/htdocs

#Expose the port 80
EXPOSE 8080

#Copy the folder from the project
ADD fancy.tar.xz /

#Copy docker entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

#User apache user
USER apache

#Definie entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

#Execute the apache2
CMD ["/usr/sbin/apachectl", "-f" , "/fancy/cnf/apache2.conf",  "-D", "FOREGROUND"]
