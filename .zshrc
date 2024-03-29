# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/var/lib/flatpak/exports/share:$PATH
export PATH=$HOME/.local/share/flatpak/exports/share:$PATH

TZ='America/New_York'
export TZ

export ZSH="$HOME/.oh-my-zsh"
export MICRO_TRUECOLOR=1

ZSH_THEME="agnoster"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases

# pacstall autocompletes
autoload bashcompinit
bashcompinit
source /usr/share/bash-completion/completions/pacstall

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts --no-title -n trevenant

### From this line is for pywal-colors
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
