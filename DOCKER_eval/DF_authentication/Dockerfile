FROM debian:latest
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests==2.22.0 
ADD authentication.py /my_server/authentication.py
ADD user.csv /data/user.csv
WORKDIR /my_server/
CMD python3 authentication.py