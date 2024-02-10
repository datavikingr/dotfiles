#!/bin/bash

debsdir="$HOME/dotfiles/.debs"
cd "$debsdir"

for file in "$debsdir"/*; do
    sudo apt install $file
done