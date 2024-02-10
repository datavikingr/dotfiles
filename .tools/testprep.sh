#!/bin/bash

cd $HOME
touch $HOME/.zshrc
echo "This has failed." >> .zshrc
touch .bash_aliases
mkdir -p .config/berry
touch .config/berry/autostart