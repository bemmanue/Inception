FROM	debian:buster

RUN	apt update &&		\
	apt install -y vsftpd

COPY	tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
