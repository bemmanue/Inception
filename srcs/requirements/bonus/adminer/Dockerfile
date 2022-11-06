FROM	debian:buster

RUN	apt update &&			\
	apt install -y wget adminer

COPY	tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["apachectl", "-D", "FOREGROUND"]
