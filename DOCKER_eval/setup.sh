#!/bin/bash
#docker network create --subnet 172.50.0.0/16 --gateway 172.50.0.1 my_network
echo "==========Lancement API datascientest/fastapi:1.0.0"
#docker container run -d --rm -p 8000:8000 
#echo "==========Création des images de test"
docker image build ~/DOCKER_eval/authentication -t authentication:latest 
#docker image build ~/DOCKER_eval/authorization -t authorization:latest 
#docker image build ~/DOCKER_eval/content -t content:latest 

#touch log.txt  
echo "==========Containerisation="
docker-compose up #>> log.txt 
echo "==========fin du process==="