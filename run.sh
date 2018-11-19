#!/bin/bash

echo "Type root path for the nixcpp followed by [ENTER]:"
read root_path

if [ "$root_path" == "" ]; then
    echo "Bad root path: " $root_path
    exit 1
else
    docker run --rm -it -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v ~/$root_path/nixcpp/.vscode/:/home/andrei/.vscode/ \
        -v ~/$root_path/nixcpp/Code/:/home/andrei/.config/Code/ \
        -v ~/$root_path/nixcpp/project/:/home/andrei/project/ \
        nixcpp:latest
    exit 0
fi