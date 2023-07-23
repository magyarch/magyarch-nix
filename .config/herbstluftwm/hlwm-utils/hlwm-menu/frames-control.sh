#!/bin/env sh
# Frames control menu

declare options=("enable
disable")

choice=$(echo -e "${options[@]}" | dmenu -i -p ' Main menu: ' -nb '#2f2b26' -sb '#2e8b57' -fn 'JetBrains Mono Medium-12' -w '760' -h '24' -x '574' -y '48')

case "$choice" in
	enable)
        choice="$HOME/.config/herbstluftwm/hlwm-utils/hlwm-menu/frames/enable"
	;;
	disable)
		choice="$HOME/.config/herbstluftwm/hlwm-utils/hlwm-menu/frames/disable"
	;;
esac
sh $choice
