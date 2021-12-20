#!/bin/bash

# purger
#pip install docker
rm -f docker_volume/api_test.log
rm -f docker_volume/log.txt 

docker rm authentication
docker rm authorization
docker rm content
docker image rm authentication
docker image rm authorization
docker image rm content
docker image rm malekidri/authentication
docker image rm malekidri/authorization
docker image rm malekidri/content


##---Construiction des images
docker image build ./DF_authentication -t authentication:latest
docker tag authentication malekidri/authentication
docker push malekidri/authentication

docker image build ./DF_authorization -t authorization:latest
docker tag authorization malekidri/authorization
docker push malekidri/authorizations

docker image build ./DF_content -t content:latest
docker tag content malekidri/content
docker push malekidri/content

#activer

docker-compose up > docker_volume/log.txt 

