#!/bin/bash

source_dir="$HOME/dotfiles" # Define the source directory
destination_dir="$HOME" # Define the destination directory

for file in "$source_dir"/*; do # Iterate over each file in the source directory
    relative_path=${file#$source_dir/} # Get the relative path of the file
    if [ -e "$destination_dir/$relative_path" ]; then # Check if the file exists in the destination directory
        rm -rf "$destination_dir/$relative_path" # Remove the file from the destination directory
        echo "Deleted: $destination_dir/$relative_path"
    fi
done

cd "$source_dir" # heads to the dots directory
stow . #creates symlinks for all the dots.
