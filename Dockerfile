FROM ubuntu
WORKDIR /
RUN apt-get update \
&& apt-get install apache2 -y \
&& apt-get install apache2-utils -y \
&& apt-get clean \
&& mkdir -p /var/www/demo/
COPY index.html /var/www/demo/
COPY demo.conf /etc/apache2/sites-available/
RUN a2ensite task.conf
RUN a2dissite 000-default.conf
#RUN service apache2 reload
#RUN '/bin/sh -c service apache2 reload'
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
