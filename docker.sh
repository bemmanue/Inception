#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
#docker rm mariadb
docker image rm $(docker images -a -q)
#docker image rm srcs_mariadb
docker volume prune 
