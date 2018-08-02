FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-an-api
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs bash curl file sudo

RUN git clone https://framagit.org/tricoteuses/tricoteuses-api-assemblee

WORKDIR tricoteuses-api-assemblee

RUN npm install --verbose

RUN curl -s https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly


RUN cargo build
# using api port s pecified in ui config
