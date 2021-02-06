# Update & Upgrade
apt-get update && apt-get -y upgrade

# Install & Config Nginx
apt-get -y install nginx

# Install & Config Php
apt-get -y install php7.3 php7.3-fpm

# Install & Config MariaDB
apt-get -y install mariadb-server

# Install & Config PhpMyAdmin
apt-get -y install wget
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz
rm -r phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpMyAdmin-5.0.4-all-languages/ /usr/share/phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/phpmyadmin 
ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin