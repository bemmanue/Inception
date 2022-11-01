FROM	debian:buster

RUN	apt update &&			\
	apt install -y redis-server
#COPY	tools/entrypoint.sh /

EXPOSE	6379

#ENTRYPOINT ["sh", "entrypoint.sh"]
#CMD ["tail", "-f"]
CMD ["redis-server", "/etc/redis/redis.conf", "--maxmemory", "2mb", "--maxmemory-policy", "allkeys-lru", "--bind", "127.0.0.1", "--daemonize", "no"]
