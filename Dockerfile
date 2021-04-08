FROM debian:buster

MAINTAINER Vanessa Zapata <ayzapata@student.42.fr>

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y wget
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y mariadb-server
RUN apt-get install -y curl

COPY /srcs/myngnix.conf /tmp
COPY /srcs/wp-config.php /tmp
COPY /srcs/config.sh ./
COPY /srcs/autoindex.sh ./

EXPOSE 80
EXPOSE 443

CMD ["bash", "config.sh"]
