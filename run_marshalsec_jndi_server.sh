#!/bin/bash

docker rm `docker ps -a | grep marshalsec | awk '{print $1}'` -f
docker rmi -f  `docker images | grep 'marshalsec' | awk '{print $3}'` 
docker build --build-arg EXPNAME=ExportObject --build-arg PORT=1389 --build-arg MSSWAY=rmi --build-arg JAVAVER=1.6 -t marshalsec .

docker run -d -p 1389:1389 -p 8000:8000 --name marshalsec marshalsec
