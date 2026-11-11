export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export TERMINAL="alacritty"
export BROWSER="firefox"
#export DISPLAY=:0
export FILE="vifmrun"
#export QT_WAYLAND_FORCE_DPI=120
export QT_SCALE_FACTOR=1.25
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_SCALE_FACTOR=1.
#export QT_FONT_DPI=120
export ELECTRON_FORCE_DEVICE_SCALE_FACTOR=1.25
export QTWEBENGINE_CHROMIUM_FLAGS="--force-device-scale-factor=1.25"

#export GTK_THEME=NovaOS-nord org.pulseaudio.pavucontrol
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"


# ------------FZF--------------
# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--bind 'enter:execute(nvim {})+abort' --preview 'bat --color=always -n --line-range :500 {}'"

#export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "  

mpd >/dev/null 2>&1 &

