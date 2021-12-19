FROM debian:latest
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests==2.22.0
WORKDIR /my_server/
CMD python3 authorization.py 