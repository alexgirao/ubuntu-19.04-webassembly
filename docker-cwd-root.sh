#!/bin/sh
# usage: ./docker-cwd-root.sh -t docker.io/alpine:3.9 /bin/sh -l
pwd=`pwd`
exec docker run --rm -i -v "${pwd}:${pwd}" -w "${pwd}" "$@"
