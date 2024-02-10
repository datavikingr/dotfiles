#! /bin/bash

# deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
deb-get install bitwarden brave-browser codium discord gh heroic onlyoffice-desktopeditors signal-desktop

# pacstall
sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
pacstall -I anytype-deb steam-deb

# homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nala & initial update
deb-get install nala
sudo nala fetch
sudo nala update
sudo nala upgrade -y 
sudo nala install git micro tmux python3 python3-pip python3-venv ranger bmon htop neofetch cbonsai docker.io docker-compose gnugo gnuchess fortune-mod unzip lolcat nethack-console -y
sudo nala install fonts-firacode fonts-font-awesome fonts-junicode -y
sudo nala install gparted stacer timeshift krita gimp calibre thunderbird kitty stow tldr -y

# flatpak
sudo nala install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# godot
cd /tmp
wget https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip
unzip Godot_v4.2.1-stable_linux.x86_64.zip
sudo cp Godot_v4.2.1-stable_linux.x86_64 /usr/bin/godot
# TODO .desktop file
cd $HOME

# calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
# TODO .desktop file

# TODO MullVad

# distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | /bin/bash
distrobox create -i docker.io/library/archlinux:latest -n arch
distrobox create -i quay.io/fedora/fedora:rawhide -n fedora

# Aliases
if [ -f ~/.zshrc ]; then
    echo "source ~/.bash_aliases" >> .zshrc
fi

cat << EOF > $HOME/.bash_aliases
# System with settings-tweaks
alias sudo='sudo '
alias apt='nala '
alias open='xdg-open '
alias ls='ls -pa --color=auto --group-directories-first'
alias tree='tree -L 2 --filelimit 25 --dirsfirst --noreport'
alias recent='ls -t -1'
alias cp='cp -i'
alias cpv='rsync -ah --info=progress2'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias ..='cd ..'
alias home='cd ~'
alias back='cd "$OLDPWD"'
alias gitroot='cd `git rev-parse --show-toplevel`'

# Informatic
alias motd='cat /etc/motd | lolcat'
alias neofetch='neofetch | lolcat'
alias yggdrasil='cbonsai -S | lolcat'
alias bonsai='cbonsai -S'
alias news='curl us.getnews.tech'
alias weather='curl https://wttr.in/Joppatowne?u'
alias moon='curl wttr.in/Moon'

# Version Control the Dots
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias configlog="config log --graph -n 5 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Developer Stuff
alias gitlog="git log --graph -n 5 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias python='python3 '
alias init-project='git init && python3 -m venv .venv && source .venv/bin/activate'

# Misc
alias update='sudo nala update && sudo nala upgrade -y && sudo nala autopurge -y && sudo nala clean && deb-get upgrade & pacstall -Up'
alias newalias='source $HOME/.bash_aliases'
alias rebash='source .bashrc'
alias rezsh='source .zshrc'
alias histsearch='history | grep'
alias trash='mv --force -t ~/.local/share/Trash '
EOF
