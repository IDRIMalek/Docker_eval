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
