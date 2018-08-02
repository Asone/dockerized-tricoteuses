FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-an-api
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs bash cargo

RUN git clone https://framagit.org/tricoteuses/tricoteuses-api-assemblee

WORKDIR tricoteuses-api-assemblee

RUN cargo build
RUN npm install --verbose

# using api port specified in ui config
