#!/bin/bash

exec	redis-server			\
	--maxmemory 2mb			\
	--maxmemory-policy allkeys-lru	\
	--daemonize no
