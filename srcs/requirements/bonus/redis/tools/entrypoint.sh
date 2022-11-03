#!/bin/bash

exec	redis-server			\
	--daemonize no			\
	--protected-mode no		\
	--maxmemory 2mb			\
	--maxmemory-policy allkeys-lru
