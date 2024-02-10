#!/bin/bash

source_dir="$HOME/dotfiles" # Define the source directory
destination_dir="$HOME" # Define the destination directory

shopt -s dotglob
for file in "$source_dir"/*; do # Iterate over each file in $HOME/dotfiles/
    relative_path=${file#$source_dir/} # Get the relative path (to $HOME/dotfiles) of the file
    if [ -d "$destination_dir/$relative_path" ]; then
            rm -rf "$destination_dir/$relative_path"
        else
            rm -f "$destination_dir/$relative_path"
        fi
done

cd "$source_dir" # heads to the dots directory
stow . #creates symlinks for all the dots, in the parent ($HOME) directory