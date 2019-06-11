
# docker build --rm --tag ubuntu-19.04-webassembly .

FROM docker.io/ubuntu:19.04

RUN set -eux; \
    apt-get update; \
    apt-get install -y \
        bzip2 file wget curl git python python3 \
        build-essential openjdk-8-jdk cmake less \
        libxml2 procps make patch xz-utils less \
        libtool pkg-config bsdmainutils

RUN set -eux; \
    git clone https://github.com/emscripten-core/emsdk.git

RUN set -eux; \
    cd emsdk; \
    ./emsdk install latest; \
    ./emsdk activate latest

ENV HOME=/emsdk

WORKDIR /emsdk

RUN set -eux; \
    apt-get install -y libtinfo5 libtinfo6; \
    chmod -v a+w /emsdk; \
    cd /emsdk; \
    ./emsdk activate latest

RUN set -eux; \
    rm -rf /var/lib/apt/lists/*
