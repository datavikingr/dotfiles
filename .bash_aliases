#!/bin/bash

# System with settings-tweaks
alias cd='cl'
alias sudo='sudo '
alias please='sudo '
#alias apt='nala '
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
alias clear='clear; source $HOME/.zshrc'
alias cat='bat --paging=never --theme=Dracula'
alias bat='bat --paging=never --theme=Dracula'
alias monfix='hyprctl dispatch movecurrentworkspacetomonitor DP-1'

# Informatic
alias motd='cat /etc/motd | lolcat'
alias neofetch='neofetch | lolcat'
alias yggdrasil='cbonsai -S | lolcat -a'
alias bonsai='cbonsai -S'
alias news='curl us.getnews.tech'
alias weather='curl https://wttr.in/Joppatowne'
alias moon='curl wttr.in/Moon'
alias currentgame='gnugo -l $HOME/currentgame.sgf --mode ascii'

# Developer Stuff
alias gitlog="git log --graph -n 5 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias python='python3 '
alias init-project='git init && python3 -m venv .venv && source .venv/bin/activate'
alias gitroot='cd `git rev-parse --show-toplevel`'

# Misc
alias newalias='source $HOME/.bash_aliases'
alias rebash='source .bashrc'
alias rezsh='source .zshrc'
alias histsearch='history | grep'
alias trash='mv --force -t ~/.local/share/Trash'
alias quickdict='compgen -c | fzf | xargs tldr'
alias commanddict='compgen -c | fzf | xargs man'
alias dirsize='du -hc . | tail -n 1'

# Music - 'mpv --shuffle --vid=no $link' for common options
alias joker="mpv 'https://www.youtube.com/watch?v=Uq7kyf1T_lk' & cava"
alias lofi="mpv 'https://www.youtube.com/watch?v=jfKfPfyJRdk' & cava"
alias C418="mpv 'https://www.youtube.com/watch?v=2xg71fa1CfI' & cava"
alias piano="mpv 'https://www.youtube.com/watch?v=csxo1flT530' & cava"
alias metal="mpv 'https://www.youtube.com/watch?v=9kGTJfwPSzI' & cava"
alias chiptune="mpv 'https://www.youtube.com/watch?v=kYxMjsKT5Wk' & cava"
alias dnb="mpv 'https://www.youtube.com/watch?v=GDtrDeaKpPc' & cava "
alias ifeellikemyself="mpv 'https://www.youtube.com/watch?v=XGTIVDt7CfU' & cava"

#Flatpaks
#alias steam="flatpak run com.valvesoftware.Steam"
#alias discord="flatpak run com.discordapp.Discord"

# Functions
gitignore() {
	local gitrootdir="$(git rev-parse --show-toplevel)"
	git rm --cached "$1" -r
	echo "$1" >> "$gitrootdir/.gitignore"
}

update() {
	sudo dnf check &&
	sudo dnf update &&
	sudo dnf clean dbcache &&
	flatpak update
}

countfiles() {
    local directory="$1"
    local count=$(find "$directory" -type f | wc -l)
    echo "Number of files in $directory: $count"
}

cl() {
    DIR="$*";
	# if no DIR given, go home
	if [ $# -lt 1 ]; then 
		DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
	ls
}

sounddev() {
	echo "Sources (Inputs):"
	pactl list sources short
	echo
	echo "Sinks (Sources):"
	pactl list sinks short
	echo
	echo "pactl set-default-{sink, source} #"
}

runefind() {
	local lat_string="$1"
	local runic_string="$2"
	cd $HOME/code/Runa/texts
	grep -nH $lat_string */ON-Lat.txt
	grep -nH $runic_string */ON-YF.txt
}
