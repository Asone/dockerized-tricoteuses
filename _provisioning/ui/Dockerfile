FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-ui
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs make g++ python bash

RUN git clone https://framagit.org/parlement-ouvert/tricoteuses-ui.git

WORKDIR tricoteuses-ui

RUN npm install
RUN npm run prepare

EXPOSE 3000

CMD ["npm","start --verbose"]