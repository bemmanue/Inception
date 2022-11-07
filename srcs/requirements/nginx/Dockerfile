FROM	debian:buster

ARG	DOMAIN_NAME
ENV	DOMAIN_NAME=$DOMAIN_NAME

RUN	apt update &&			\
	apt install -y openssl nginx

COPY	conf/			/etc/nginx/conf.d
COPY	tools/index.html	/var/www/html
COPY	tools/index.css		/var/www/html	
COPY	tools/entrypoint.sh	/

RUN	sed -i "s/domain_name/$DOMAIN_NAME/" /etc/nginx/conf.d/wordpress.conf

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
