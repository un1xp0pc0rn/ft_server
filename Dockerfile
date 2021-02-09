FROM debian:buster
LABEL maintainer="chervy@student.42lyon.fr"

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server mariadb-client
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mbstring php7.3-mysql
RUN apt-get -y install wget
RUN apt-get -y install openssl

RUN mkdir /srcs
COPY srcs /srcs/

RUN cd /srcs/phpmyadmin \
&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz

RUN cd /srcs/wordpress \
&& wget https://wordpress.org/latest.tar.gz

# Config Nginx
RUN mkdir -p /var/www/localhost \
&& chown -R $USER:$USER /var/www/* \
&& chmod -R 755 /var/www/* \
&& mv /srcs/nginx/localhost_index_on /etc/nginx/sites-available/ \
&& ln -s /etc/nginx/sites-available/localhost_index_on /etc/nginx/sites-enabled/

# Config MariaDB
RUN service mysql start \
&& echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root \
&& echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;" | mysql -u root \
&& echo "FLUSH PRIVILEGES;" | mysql -u root

# Install phpMyAdmin
RUN cd /srcs/phpmyadmin \
&& tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz \
&& rm -r phpMyAdmin-5.0.4-all-languages.tar.gz \
&& mv /srcs/phpmyadmin/phpMyAdmin-5.0.4-all-languages /var/www/localhost/phpmyadmin

# Config phpMyAdmin
RUN service mysql start \
&& mv /srcs/phpmyadmin/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php \
&& chown -R www-data:www-data /var/www/localhost/phpmyadmin \
&& mysql < /var/www/localhost/phpmyadmin/sql/create_tables.sql -u root

# Install WordPress
RUN cd /srcs/wordpress \
&& tar -xf latest.tar.gz \
&& mv /srcs/wordpress/wordpress /var/www/localhost/ \
&& chown -R www-data:www-data /var/www/localhost/wordpress

# Config Wordpress
RUN service mysql start \
&& echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root \
&& echo "GRANT ALL ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root \
&& echo "FLUSH PRIVILEGES;" | mysql -u root \
&& mv /srcs/wordpress/wp-config.php /var/www/localhost/wordpress/wp-config.php

# Config SSL
RUN mkdir /etc/nginx/ssl \
&& touch /etc/nginx/ssl/localhost.key \
&& touch /etc/nginx/ssl/localhost.pem \
&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.pem -subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=chervy/CN=localhost"

EXPOSE 80
EXPOSE 443

CMD bash /srcs/run.sh