#!/bin/bash

# Start redis-server
exec	redis-server			\
	--daemonize no			\
	--protected-mode no		\
	--maxmemory 2mb			\
	--maxmemory-policy allkeys-lru
