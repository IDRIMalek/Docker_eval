#!/bin/bash
echo "==========Création des images"
docker image build ~/DOCKER_eval/authentication -t authentication:latest 
#docker image build ~/DOCKER_eval/authorization -t authorization:latest 
#docker image build ~/DOCKER_eval/content -t content:latest 

touch log.txt  
echo "==========Containerisation="
docker-compose up >> log.txt 
echo "==========fin du process==="