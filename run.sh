#!/bin/bash

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/dockerbuild/nixcpp/.vscode/:/home/andrei/.vscode/ \
    -v ~/dockerbuild/nixcpp/Code/:/home/andrei/.config/Code/ \
    -v ~/dockerbuild/nixcpp/project/:/home/andrei/project/ \
    nixcpp:latest
