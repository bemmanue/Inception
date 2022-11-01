#!/bin/bash

exec	redis-server /etc/redis/redis.conf	\
	--maxmemory 2mb				\
	--maxmemory-policy allkeys-lru		\
	--daemonize no
