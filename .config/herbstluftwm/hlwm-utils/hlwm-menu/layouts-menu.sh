#!/bin/env sh
# hlwm-utils main manu

declare options=("centered-master
dwindle
master-stack
vertical
|
reset")

choice=$(echo -e "${options[@]}" | dmenu -i -p ' Select layput: ' -nb '#2f2b26' -sb '#2e8b57' -fn 'JetBrains Mono Medium-12' -w '760' -h '24' -x '574' -y '48')

case "$choice" in
	cetered-master)
		choice="$HOME/.config/herbstluftwm/hlwm-utils/layouts/centered-master"
	;;
	dwindle)
		choice="$HOME/.config/herbstluftwm/hlwm-utils/layouts/dwindle"
    ;;
    master-stack)
        choice="$HOME/.config/herbstluftwm/hlwm-utils/layouts/master-stack"
    ;;
    vertical)
        choice="$HOME/.config/herbstluftwm/hlwm-utils/layouts/vertical"
	;;
	reset)
		choice="$HOME/.config/herbstluftwm/hlwm-utils/layouts/reset"
	;;
esac
sh $choice
