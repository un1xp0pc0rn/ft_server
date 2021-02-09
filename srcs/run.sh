#!/bin/bash

if [ $index == "off" ]
then
	rm /etc/nginx/sites-available/localhost_index_on
	rm /etc/nginx/sites-enabled/localhost_index_on
	mv /srcs/nginx/localhost_index_off /etc/nginx/sites-available/
	ln -s /etc/nginx/sites-available/localhost_index_off /etc/nginx/sites-enabled/
fi

rm -rf /srcs

service php7.3-fpm start
service nginx start
service mysql start
sleep infinity