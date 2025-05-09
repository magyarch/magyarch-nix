export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifmrun"
