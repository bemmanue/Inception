FROM debian:buster

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
 
RUN apt update && apt install -y mariadb-server

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
COPY ./tools/init.sh		/

RUN chmod +x init.sh && sh init.sh

ENTRYPOINT ["/usr/bin/mysqld_safe"]
