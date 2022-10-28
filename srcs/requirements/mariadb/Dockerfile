FROM debian:buster

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

ENV MYSQL_ROOT_PASSWORD=12345
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=bemmanue
ENV MYSQL_PASSWORD=12345
 
RUN apt update && apt install -y mariadb-server

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
COPY ./tools/initDB.sh		/

RUN chmod +x initDB.sh && sh initDB.sh

ENTRYPOINT ["/usr/bin/mysqld_safe"]
