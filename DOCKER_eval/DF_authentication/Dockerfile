FROM debian:latest
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests==2.22.0 && pip3 install docker==5.0.3
WORKDIR /my_server/
CMD python3 authentication.py