FROM debian:buster
LABEL maintainer="chervy@student.42lyon.fr"

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install nginx \
&& apt-get -y install mariadb-server mariadb-client \
&& apt-get -y install php7.3 php7.3-fpm php7.3-mbstring php7.3-mysql \
&& apt-get -y install php7.3-cli php7.3-json php7.3-pdo php7.3-zip php7.3-gd php7.3-curl php7.3-xml php7.3-bcmath php7.3-json \
&& apt-get -y install wget \
&& apt-get -y install openssl

RUN mkdir /srcs
COPY srcs /srcs/

RUN cd /srcs/phpmyadmin \
&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
&& cd /srcs/wordpress \
&& wget https://wordpress.org/latest.tar.gz

# Config Nginx
RUN chown -R $USER:$USER /var/www/* \
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
&& mv /srcs/phpmyadmin/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin

# Config phpMyAdmin
RUN service mysql start \
&& mv /srcs/phpmyadmin/config.inc.php /var/www/html/phpmyadmin/config.inc.php \
&& chown -R www-data:www-data /var/www/html/phpmyadmin \
&& mysql < /var/www/html/phpmyadmin/sql/create_tables.sql -u root

# Install WordPress
RUN cd /srcs/wordpress \
&& tar -xf latest.tar.gz \
&& mv /srcs/wordpress/wordpress /var/www/html/ \
&& chown -R www-data:www-data /var/www/html/wordpress

# Config Wordpress
RUN service mysql start \
&& echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root \
&& echo "GRANT ALL ON wordpress.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root \
&& echo "FLUSH PRIVILEGES;" | mysql -u root \
&& mv /srcs/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php

# Config SSL
RUN mkdir /etc/nginx/ssl \
&& touch /etc/nginx/ssl/nginx-selfsigned.key \
&& touch /etc/nginx/ssl/nginx-selfsigned.crt \
&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=chervy/CN=localhost"

EXPOSE 80
EXPOSE 443

CMD bash /srcs/run.sh