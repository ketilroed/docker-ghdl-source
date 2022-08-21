#!/bin/zsh
docker run --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=host.docker.internal:0 -v $PWD:/home/docker/data ghdl:v1
