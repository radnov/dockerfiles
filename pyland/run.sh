#!/usr/bin/env bash

#
# This looks so taped together \_('.')_/
#

image=python:slim-buster
name="docker ps --format {{.Names}}"

is_running() {
    if docker ps --format '{{.Image}}' | grep -q $image; then
        echo "$image is running"
        return 0
    else
        echo "$image is not running" 
        return 1
    fi
}

start_it() {
    if ! is_running; then
        echo "Starting $image"
        docker run --rm -it -d -v $(pwd):/app -w /app --entrypoint python3 $image
    fi
}

get_in() {
    echo "Pseudo ssh into $image"
    docker exec -it $($name) /bin/bash 
}

run_it() {
    docker exec -it $($name) python3 "$1"
}	

stop_it() {
    echo "Stopping $image"
    docker stop $(docker ps --filter ancestor=$image -q)
}

case $1 in
    "start")
        start_it
        ;;
    "stop")
        stop_it
        exit 0
        ;;
    "ssh")
        start_it
        get_in
        ;;
    "run")
        run_it "$2"
        ;;
esac

