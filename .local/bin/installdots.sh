#!/usr/bin/env bash

set -e

REPO="https://github.com/datavikingr/dotfiles"
DEST="$HOME/dotfiles"

git clone "$REPO" "$DEST"
cd "$DEST" || exit 1

echo "Attempting to stow dotfiles..."
if stow --target="$HOME" .; then
	echo "Dotfiles successfully stowed."
	exit 0
else
	echo "Stow failed due to conflicts. Attempting to identify conflicts..."

	# Dry-run to get the list of conflicting files
	conflicts=$(stow -nv --target="$HOME" . | grep 'existing target is neither a link nor a directory' | awk '{print $NF}')

	if [ -z "$conflicts" ]; then
		echo "Stow failed, but no conflicts found via dry-run. Please investigate manually."
		exit 1
	fi

	echo "The following files are blocking stow:"
	echo "$conflicts"
	echo

	read -p "Do you want to delete these files and retry? [y/N] " confirm
	if [[ "$confirm" =~ ^[Yy]$ ]]; then
		echo "$conflicts" | while read -r file; do
			echo "Deleting $file"
			rm -rf "$file"
		done

		echo "Retrying stow..."
		if stow --target="$HOME" .; then
			echo "Dotfiles successfully stowed after cleanup."
			exit 0
		else
			echo "Stow still failed. Aborting."
			exit 1
		fi
	else
		echo "Aborted by user. Dotfiles not modified."
		exit 1
	fi
fi
