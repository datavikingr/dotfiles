#!/bin/bash

# unsure if working

dots_dir="$HOME/dotfiles" # Define the source directory
home_dir="$HOME" # Define the home/destination directory

shopt -s dotglob
for file in "$dots_dir"/*; do # Iterate over each file in $HOME/dotfiles/
    relative_path=${file#$dots_dir/} # Get the relative path (to $HOME/dotfiles) of the file
    if [ -d "$home_dir/$relative_path" ]; then
            rm -rf "$home_dir/$relative_path"
        else
            rm -f "$home_dir/$relative_path"
        fi
done

cd "$dots_dir" # heads to the dots directory
stow . #creates symlinks for all the dots, in the parent ($HOME) directory