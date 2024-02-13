# System with settings-tweaks
alias cd='cl'
alias sudo='sudo '
alias please='sudo '
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

# Informatic
alias motd='cat /etc/motd | lolcat'
alias neofetch='neofetch | lolcat'
alias yggdrasil='cbonsai -S | lolcat -a'
alias bonsai='cbonsai -S'
alias news='curl us.getnews.tech'
alias weather='curl https://wttr.in/Joppatowne'
alias moon='curl wttr.in/Moon'

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

# Functions
gitignore() {
	local gitrootdir="$(git rev-parse --show-toplevel)"
	git rm --cached "$1" -r
	echo "$1" >> "$gitrootdir/.gitignore"
}

update() {
	sudo nala update &&
	sudo nala upgrade -y &&
	sudo deb-get upgrade -y &&
	pacstall -Up &&
	sudo nala autopurge &&
	sudo nala clean
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