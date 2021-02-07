service nginx start
service php7.3-fpm start
service mysql start
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root