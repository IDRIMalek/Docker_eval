FROM debian:latest
RUN apt-get update && apt-get install python3-pip -y && pip3 install requests==2.22.0
ADD authentication.py /my_server/authentication.py 
WORKDIR /my_server/
COPY user.csv /my_server/user.csv
COPY api_test.log /my_server/api_test.log
CMD python3 authentication.py