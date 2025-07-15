#!/usr/bin/env bash

set -euo pipefail

# Get all subdirectories in the current directory (excluding .git if present)
PACKAGES=(
  $(find . -maxdepth 1 -type d ! -name ".git" ! -name "." -exec basename {} \;)
)

for package in "${PACKAGES[@]}"; do
  echo "Stowing $package..."
  #stow --verbose "$package"
done

echo "All packages stowed successfully."