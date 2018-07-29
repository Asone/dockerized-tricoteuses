FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-api
LABEL VERSION=1


RUN apk update && apk upgrade && \
    apk add --no-cache git python

RUN git clone https://framagit.org/parlement-ouvert/tricoteuses-daemon.git

WORKDIR tricoteuses-daemon

