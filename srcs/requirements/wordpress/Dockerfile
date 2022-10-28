FROM	debian:buster

ARG	PHP_VERSION=7.3

RUN	apt update && apt install -y	\
	php$PHP_VERSION			\
	php$PHP_VERSION-fpm		\
	php$PHP_VERSION-mysqli		\
	mariadb-client			\
	sendmail			\
	curl

COPY	conf/www.conf		/etc/php/7.3/fpm/pool.d/
COPY	tools/entrypoint.sh	/

RUN	mkdir -p /run/php/

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["/usr/sbin/php-fpm7.3", "-F"]
