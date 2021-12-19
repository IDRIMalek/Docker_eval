#!/bin/bash

# purger
#sudo rm -R -f docker_volume
docker rm authentication
docker rm authorization
docker rm content
docker image rm authentication
docker image rm authorization
docker image rm content
docker image rm malekidri/authentication
docker image rm malekidri/authorization
docker image rm malekidri/content

#créer
#mkdir docker_volume
docker image build ./authentication -t authentication:latest
docker tag authentication malekidri/authentication
docker push malekidri/authentication

docker image build ./authorization -t authorization:latest
docker tag authorization malekidri/authorization
docker push malekidri/authorizations

docker image build ./content -t content:latest
docker tag content malekidri/content
docker push malekidri/content

#activer
touch docker_volume/log.txt  
docker-compose up > docker_volume/log.txt

