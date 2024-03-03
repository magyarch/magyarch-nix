#!/usr/bin/env bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
bspwm
nixconfig
profile
sxhkd
vifm
xresources
xprofile
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -fn 'JetBrains Mono Nerd Font-12' -p 'Edit files: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alias)
		choice="$HOME/.config/aliasrc"
	;;
	bash)
		choice="$HOME/.bashrc"
	;;
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
	;;
	profile)
		choice="$HOME/.profile"
	;;
	sxhkd)
	        choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	nixconfig)
		choice="/etc/nixos/configuration.nix"
	;;
	xresources)
		choice="$HOME/.Xresources"
	;;
        xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
subl  "$choice"
