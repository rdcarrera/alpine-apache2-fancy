FROM alpine:latest
MAINTAINER Ruben D. Carrera <rdcarrera> 

#ENV Variables
ENV FANCY_FOLDER /fancy/mount

#Install the apache2 & apache2-ctl
RUN apk add --update apache2 apache2-ctl

#Expose the port 80
EXPOSE 80

#Copy the folder from the project
ADD fancy.tar.xz /

#Copy docker entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

#Update the apk repository
ENTRYPOINT ["/docker-entrypoint.sh"]

#Execute the apache2 
CMD ["/usr/sbin/apachectl", "-f" , "/fancy/cnf/apache2.conf",  "-D", "FOREGROUND"]
