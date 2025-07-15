#! /bin/bash

# deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
deb-get install bitwarden brave-browser codium gh heroic onlyoffice-desktopeditors signal-desktop

# pacstall
sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
pacstall -I anytype-deb
pacstall -I mullvad-vpn-deb

# homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nala & initial update
deb-get install nala
sudo nala fetch
sudo nala update
sudo nala upgrade -y 
sudo nala install git micro tmux python3 python3-pip python3-venv ranger bmon htop neofetch cbonsai docker.io docker-compose gnugo gnuchess fortune-mod unzip lolcat nethack-console -y
sudo nala install fonts-firacode fonts-font-awesome fonts-junicode -y
sudo nala install fzf gparted stacer timeshift krita gimp calibre thunderbird kitty stow tldr -y

# flatpak
sudo nala install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.valvesoftware.Steam
flatpak install com.discordapp.Discord

# godot
cd /tmp
wget https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip
unzip Godot_v4.2.1-stable_linux.x86_64.zip
sudo cp Godot_v4.2.1-stable_linux.x86_64 $HOME/.local/bin/godot
cd $HOME

# calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | /bin/bash
distrobox create -i docker.io/library/archlinux:latest -n arch
distrobox create -i quay.io/fedora/fedora:rawhide -n fedora