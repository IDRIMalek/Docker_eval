#!/bin/bash
docker network create --subnet 172.50.0.0/16 --gateway 172.50.0.1 my_network

docker image build ~/DOCKER_eval/authentication -t authentication:latest 
docker image build ~/DOCKER_eval/authorization -t authorization:latest 
#docker image build ~/DOCKER_eval/content -t content:latest 

touch log.txt  
docker-compose up >> log.txt 
