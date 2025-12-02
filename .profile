#!/usr/bin/env bash
# Profile file. Runs on login.

# Adds `~/.local/bin` and all subdirectories to $PATH
#export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
#export EDITOR="nvim"
#export TERMINAL="alacritty"
#export BROWSER="microsoft-edge"
#export READER="zathura"
#export FILE="vifmrun"
#export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
#export QT_SCALE_FACTOR=1.3
#export ELM_SCALE=1.6
#export GDK_SCALE=0.6
#export XCURSOR_SIZE=24
#export DISPLAY=":0"
#export AMD_VULKAN_ICD="RADV"
#export WLR_NO_HARDWARE_CURSOR=1

 #less/man colors
#export GTK_THEME=NovaOS-nord org.pulseaudio.pavucontrol
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

mpd >/dev/null 2>&1 &




STEAM_FORCE_DESKTOPUI_SCALING='1.5'
