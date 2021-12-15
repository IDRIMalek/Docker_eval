FROM debian:latest
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests==2.22.0
ADD content.py /my_server/content.py
WORKDIR /my_server/
CMD python3 content.py