#$HOME/dotfiles/.config/scripts/pokemonbattle.sh
#$HOME/.config/scripts/hackerlogin.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# gtk
export GTK_THEME=Catppuccin-Mocha-Mauve

# config path
export PATH="$HOME/.local/bin:$PATH"
for p in "$HOME/bin" "$HOME/go/bin" "$HOME/.cargo/bin" "$HOME/.dotnet/tools" "$HOME/.npm-global/bin" "$HOME/.yarn/bin"; do
  [ -d "$p" ] && export PATH="$p:$PATH"
done

# set text editor
export EDITOR=nvim
export VISUAL=nvim

# fzf 
source <(fzf --zsh)

# colors configs
export COLORTERM=truecolor
export MICRO_TRUECOLOR=1
if [ -f "$HOME/.config/scripts/global_colors.sh" ]; then
  source "$HOME/.config/scripts/global_colors.sh"
fi

#  history
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey "^R" history-incremental-search-backward
setopt autocd extendedglob notify
setopt append_history
setopt inc_append_history
setopt share_history

#compinit
bindkey -e
zstyle :compinstall filename '/home/datavikingr/.zshrc'
autoload -Uz compinit
compinit

case "$(hostname)" in
  cloudrunner)
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme;;
  cloudchaser)
    source $HOME/powerlevel10k/powerlevel10k.zsh-theme
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";;
esac

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
source "$HOME/.aliases"
