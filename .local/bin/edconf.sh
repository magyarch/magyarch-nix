#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
i3config
i3blocks
profile
sxhkd
vifm
xresources
xprofile
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -nb '#282a36' -nf '#c3cdc8' -sb '#6272a4' -fn 'JetBrains Mono Nerd Font-12' -p 'Edit files: ')

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
	i3config)
		choice="$HOME/.config/i3/config"
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
	i3blocks)
		choice="$HOME/.config/i3blocks/config"
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
geany  "$choice"
