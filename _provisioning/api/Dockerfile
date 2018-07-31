FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-api
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs

RUN git clone https://framagit.org/parlement-ouvert/tricoteuses-api

WORKDIR tricoteuses-api

RUN npm install --verbose

# using api port specified in ui config
EXPOSE 2048 

CMD ["npm","start"]