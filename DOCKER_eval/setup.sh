#!/bin/bash
mkdir docker_volume
#docker volume create --name my_volume
docker image build ~/DOCKER_eval/authentication -t authentication:latest 
#docker image build ~/DOCKER_eval/authorization -t authorization:latest 
#docker image build ~/DOCKER_eval/content -t content:latest 

#touch log.txt  
docker-compose up #>> log.txt 

