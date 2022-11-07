FROM	debian:buster

RUN	apt update &&			\
	apt install -y openssl nginx

COPY	conf/wordpress.conf	/etc/nginx/conf.d
COPY	tools/index.html	/var/www/html
COPY	tools/index.css		/var/www/html	
COPY	tools/entrypoint.sh	/

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
