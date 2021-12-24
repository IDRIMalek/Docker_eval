sudo apt-get update
sudo apt-get upgrade
python3
sudo apt install python3-pip python3-virtualenv
aws s3 ls
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
ls
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
ls
docker-compose --version
ls
docker ps
docker ps -a
exit
ls
ll
sudo apt install zip
docker container run -p 8000:8000 datascientest/fastapi:1.0.0
ls
docker image pull datascientest/fastapi:1.0.0
mkdir DOCKER_eval
cd DOCKER_eval/
python authentication.py 
python3  authentication.py 
git config --global user.name "IDRIMalek"
git config --global user.email idri.malek@gmail.com
python3  authorizationv1.py 
docker image build . -t authentication:latest
ls
docker image build . -t authentication:latest
docker image ls
docker system purne
docker system purne -a
docker system prune
docker image ls
docker image build . -t my_image:latest
ls
cd DOCKER_eval/
docker image build . -t my_image:latest
docker image ls
ls
docker system prune
docker image build . -t my_image:latest
docker image ls
docker run -it debian
mkdir my_docker_image
mkdir my_docker_image && cd $_
docker image ls
docker run -it exo
docker container run -p 5000:5000 -d myexoatest
docker container run -p 5000:5000 -d exo:latest
curl -X GET -i http://localhost:9200
curl -X GET -i http://34.244.150.51:9200
curl - X GET -i  http://0.0.0.0:8000/permissions?username=alice&password=wonderland
curl - X GET -i  http://0.0.0.0:8000/permissions?username=alice&password=wonderland
curl -X GET -i http://localhost:5000
docker image push malekidri/exo:latest
cd /docker.io
docker image ls
docker image push exo:latest
docker push malekidri/malekidri:tagname
docker pull malekidri/malekidri
docker login -u malekidri
docker image push exo:latest
docker tag exo malekidri/exo
docker push malekidri\exo
docker image ls
docker push malekidri/exo
ls
cd DOCKER_eval/
ls
python3 authentication.py 
docker image pull elasticsearch:7.2.0
docker container run -d -rm -e discovery.type=single-node --name 
docker container run -d -rm -e discovery.type=single-node --name my_es_container elasticsearch 
docker container run -d --rm -e discovery.type=single-node --name my_es_container elasticsearch 
docker container run -d --rm -e "discovery.type=single-node" --name my_es_container elasticsearch:7.2.0 
docker container inspect my_es_container | grep IPAddress
curl -X GET -i http://172.17.0.2:9200
docker container run -p 8000:8000 datascientest/fastapi:1.0.0
docker container inspect datasceintest/fastapi | grep IPAddress
docker container ps -a
docker container inspect sleepy_sinoussi | grep IPAddress
ls
python authentication.py 
python3 authentication.py 
docker container run -it -d authentication
docker image ls
pip freeze
docker image ls
docker image rm 129ef3cbbc5e
docker image ls
docker image rm 184795d527f8
python3 authentication.py 
ls
docker-compose up
ls
bash setup.sh 
bash setup.sh > api_test.log 
docker push authentication
docker tag authentication:latest 
docker tag authentication:latest  malekidri/authantication
docker push authentication
docker push malekidri/authentication
docker tag  authentication malekidri/authentication
docker push malekidri/authentication
/bin/python3 /home/ubuntu/.vscode-server/extensions/ms-python.python-2021.12.1559732655/pythonFiles/shell_exec.py /bin/python3 -m pip install -U --force-reinstall ipykernel /tmp/tmp-125789oyANxtmkVHsN.log
\home\ubuntu\DOCKER_eval\setup.sh
cd DOCKER_eval/
bash setup.sh 
docker container ls
bash setup.sh 
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic alice:wonderland'  -d '{
  "subject": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic alice:wonderland'  -d '{
  "subject": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic alice:wonderland'  -d '{
  "subject": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic admin:4dm1N'  -d '{
  "subject": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -i
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic admin:4dm1N'  -d '{
  "subject": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic admin:4dm1N'  -d '{
  "subjects": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic admin:4dm1N'  -d '{
  "subjects": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
curl -X 'POST'   'http://127.0.0.1:8000/qcm'   -H 'accept: application/json'   -H 'Content-Type: application/json'   -H 'Authorization: Basic admin:4dm1N'  -d '{
  "subjects": ["Machine Learning", "BDD"],
  "use": "Total Bootcamp"
}'
mkdir FASTAPI
cd FASTAPI/FASTAPI_eval/
source bin/activate
uvicorn main:api --reload
pip install -r requirements.txt
uvicorn main:api --reload
pip install uvicorn
uvicorn main:api --reload
pip install pandas
uvicorn main:api --reload
pip install fastapi
uvicorn main:api --reload
\home\ubuntu\DOCKER_eval\setup.sh
cd DOCKER_eval/
bash setup.sh 
docker container run -p 8000:8000 datascientest/fastapi:1.0.0
bash setup.sh 
docker container run -it -p 8000:8000 datascientest/fastapi:1.0.0
docker container ls
docker container run -p 8000:8000 datascientest/fastapi:1.0.0 -d
docker container run -d -p 8000:8000 datascientest/fastapi:1.0.0 
docker container ls
docker container stop 1b3aa92bf1a2
docker container ls
docker container run -it -p 8000:8000 datascientest/fastapi:1.0.0 bash
ls
cp docker-compose.yml /ubuntu/docker-compose.yml
cp docker-compose.yml ~/ubuntu/docker-compose.yml
cp docker-compose.yml ~/docker-compose.yml
docker container run -p 8000:8000 datascientest/fastapi:1.0.0
mkdir fastapi
cd DOCKER_eval/
ls
bash setup.sh 
docker container run -p -d --rm 8000:8000 datascientest/fastapi:1.0.0
docker container run -p -d 8000:8000 datascientest/fastapi:1.0.0
bash setup.sh 
clear
bash setup.sh 
clear
docker container ls
bash setup.sh 
clear
bash setup.sh 
ls
docker-compose up
clear
docker-compose up
docker network create --subnet 172.50.0.0/16 --gateway 172.50.0.1 my_network
cd DOCKER_eval/
bash setup.sh 
docker volume create --name my_volume
cd ubuntu/DOCKER_eval/
mkdir doc
touch tasks
cd doc/ & touch tasks
cd ..
ls
cd ..
ls
mkdir docker_volumes
cd ubuntu/
mkdir docker_volumes
ls
rm -R docker_volumes/
ls
rm -R -f docker_volumes/
sudo rm -R -f docker_volumes/
ls
cd ..
ls
cd ubuntu/
cd ubuntu/DOCKER_eval/
bash setup.sh
cd /
ls
cd ~/DOCKER
cd ~/DOCKER_eval/
bash setup.sh
docker container ls
docker container ps
docker container ps -a
docker container -rm my_api_container
docker container --rm my_api_container
docker system purne

bash setup.sh
sudo rm -R -f docker_volume
bash setup.sh
sudo rm -R -f docker_volume
bash setup.sh
/bin/python3 /home/ubuntu/DOCKER_eval/docker_volume/authentication.py
cd ubuntu/
sudo rm -R -f docker_volume
cd DOCKER_eval/
sudo rm -R -f docker_volume
cd /home/ubuntu/DOCKER_eval/docker_volume
ls
cd /var/lib/docker/volumes/docker_eval_my_volume/_data
ls
cd ~/
cd DOCKER_eval/
sudo rm -R -f docker_volume
cd ..
ls -R DOCKER_eval/
tree -d DOCKER_eval/
apt-get install tree
sudo pacman -S tree
sudo apt-get install tree
tree -d DOCKER_eval/
tree  DOCKER_eval/
docker volume -rm docker_eval_my_volume
docker volume ps
docker volume ls
docker volume --rm docker_eval_my_volume
docker volume rm docker_eval_my_volume
docker network rm docker_eval_my_volume
docker network rm docker_eval_my_network 
rm -f docker_volum/api_test.log
rm -F docker_volum/api_test.log
rm  docker_volum/api_test.log
rm -f docker_volume/api_test.logg
cd DOCKER_eval/
rm -f docker_volume/api_test.log
pip install docker
docker container ps -a
cd ubuntu/DOCKER_eval/
bash setup.sh
cd authorization/
cd ..
docker tag authorization malekidri/authorization
docker push malekidri/authorization
bash setup.sh
docker container ps
docker container ps -a
docker rm malekidri/content:latest 
docker rm content
docker image rm content
bash setup.sh
cd docker_volume/
bash setup.sh
cd ..
bash setup.sh
docker compose up

docker compose up
docker-compose up
bash setup.sh
pip freeze
clear
cd ubuntu/
cd DOCKER_eval/
bash setup.sh
docker inspect my_api_container 
docker inspect my_api_container | grep IPAddress
docker inspect my_api_container["ID"]
docker inspect my_api_container["Id"]
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my_api_container
bash setup.sh
ls
mkdir chrurn
ls
ls 
cd CHURN/
ls
cd Projet2_DE/
source Projet2_DE_venv/bin/activate
ls
cd Projet2_DE_venv/
ls
uvicorn.run(server, host="0.0.0.0", port=int(5000))
python3 
ls
cd Projet2
source bin/activate
pip freeze > requirements.txt
cpvirtualenv FASTAPI Projet2
exit
cd Projet2
python3 -m venv Projet2
ls
cd ..
ls
cd Projet2
ls
source bin/activate
ls
cd /$
cd /
cd home/ubuntu/
ls
deactivate
cd Projet2/
source bin/activate
clear
uvicorn api:api --reload
cd ls
ls
uvicorn api:app --reload
