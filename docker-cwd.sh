#!/bin/sh
# usage: ./docker-cwd.sh alpine:3.9 sh -x -c 'date > hi.txt'
# usage: ./docker-cwd.sh -t docker.io/alpine:3.9 /bin/sh -l
pwd=`pwd`
exec docker run --rm -i --user "$(id -u):$(id -g)" -v "${pwd}:${pwd}" -w "${pwd}" "$@"
