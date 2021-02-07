FROM debian:buster
LABEL maintainer="chervy@student.42lyon.fr"

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server mariadb-client
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get -y install wget

RUN mkdir /srcs
COPY srcs /srcs/

RUN bash /srcs/mariadb/config_mariadb.sh

RUN mkdir /var/www/localhost

RUN bash /srcs/phpmyadmin/config_phpmyadmin.sh

CMD bash /srcs/run.sh