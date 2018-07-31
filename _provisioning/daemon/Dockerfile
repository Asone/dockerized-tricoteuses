FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-daemon
LABEL VERSION=1


RUN apk update && apk upgrade && \
    apk add --no-cache git python python-dev python3 python3-dev gcc musl-dev libpq postgresql-dev build-base\
    linux-headers build-base bash git ca-certificates && \ 
    python3 -m ensurepip && \ 
    rm -r /usr/lib/python*/ensurepip && \ 
    pip3 install --upgrade pip setuptools
  
 #   if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 

RUN git clone https://framagit.org/parlement-ouvert/tricoteuses-daemon.git

WORKDIR tricoteuses-daemon


RUN pip3 install requests
RUN pip3 install psycopg2


