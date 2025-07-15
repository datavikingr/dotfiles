#!/bin/bash

#berry and dependencies
apt install wget curl apt-utils libx11-dev libxft-dev libxinerama-dev -y
wget https://github.com/barnumbirr/berry-debian/releases/download/v0.1.11-1/berry_0.1.11-1_amd64_bullseye.deb
dpkg -i berry_0.1.11-1_amd64_bullseye.deb
rm berry_0.1.11-1_amd64_bullseye.deb
rm -rf /usr/share/xsessions/
mkdir -p /usr/share/xsessions
mv .config/berry/berry.desktop /usr/share/xsessions/
apt install sxhkd polybar rofi picom feh pulseaudio dunst xterm kitty thunar python3 python3-pip lxappearance -y
