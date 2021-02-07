cd srcs/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz
rm -r phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpMyAdmin-5.0.4-all-languages/ /usr/share/phpMyAdmin
mv config.inc.php /usr/share/phpMyAdmin/config.inc.php
#ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin 
#ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin