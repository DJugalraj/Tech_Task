FROM ubuntu
WORKDIR /
RUN apt-get update \
&& apt-get install apache2 -y \
&& apt-get install apache2-utils -y \
&& apt-get clean \
&& mkdir -p /var/www/tech/
COPY index.html /var/www/tech/
COPY tech.conf /etc/apache2/sites-available/
RUN a2ensite tech.conf
RUN a2dissite 000-default.conf
#RUN service apache2 reload
#RUN '/bin/sh -c service apache2 reload'
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
