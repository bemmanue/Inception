FROM	debian:buster

RUN	apt update &&		\
	apt install -y adminer

COPY	tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["apachectl", "-D", "FOREGROUND"]
