FROM	debian:buster

RUN	apt update &&			\
	apt install -y redis-server

COPY	tools/entrypoint.sh /

EXPOSE	6379

ENTRYPOINT ["sh", "entrypoint.sh"]
