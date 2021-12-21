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

docker-compose down
docker volume prune
docker system prune -a
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q) 

###---Construiction des images
echo -n "Do you want to rebuilt images (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty
if echo "$answer" | grep -iq "^y" ;then
    docker image build ./DF_authentication -t authentication:latest
    docker tag authentication malekidri/authentication
    docker push malekidri/authentication

    docker image build ./DF_authorization -t authorization:latest
    docker tag authorization malekidri/authorization
    docker push malekidri/authorization

    docker image build ./DF_content -t content:latest
    docker tag content malekidri/content
    docker push malekidri/content
else
    echo No
fi



#activer
touch docker_volume/log.txt
docker-compose up  > docker_volume/log.txt

