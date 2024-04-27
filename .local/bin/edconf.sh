#!/usr/bin/env bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("aliasrc
zshrc
bspwmrc
nixconfig
.profile
sxhkdrc
vifmrc
Xresources
.xprofile
quit")

choice=$(echo -e "${options[@]}" | dmenu -p 'Edit files: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	aliasrc)
		choice="$HOME/.config/aliasrc"
	;;
	zshrc)
		choice="$HOME/.config/zsh/.zshrc"
	;;
	bspwmrc)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	.profile)
		choice="$HOME/.profile"
	;;
	sxhkdrc)
	        choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	vifmrc)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	nixconfig)
		choice="/etc/nixos/configuration.nix"
	;;
	Xresources)
		choice="$HOME/.Xresources"
	;;
    xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
kitty -e nvim  "$choice"
