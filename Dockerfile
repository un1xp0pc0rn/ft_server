FROM debian:buster
LABEL maintainer="chervy@student.42lyon.fr"
COPY srcs/phpmyadmin /etc/nginx/sites-available/
COPY srcs/config.sh .
RUN bash config.sh
COPY srcs/run.sh .
CMD bash run.sh