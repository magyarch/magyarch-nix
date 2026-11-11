#!/usr/bin/env bash


# Utilities
/home/xeoncpu/.screenlayout/monitor.sh &
nm-applet &
setxkbmap hu &
#picom --config $HOME/.config/qtile/scripts/picom.conf &
pidof -q picom || picom --config $HOME/.config/compfy.conf &
xsetroot -cursor_name left_ptr &   # Change cursor from default x shape

xset r rate 300 50 &	# Speed xrate up

#xrdb .Xresources &

#picom --experimental-backends --shadow-exclude-reg '1920+0-0' --opacity-rule "85:class_g ='urxvt'" --opacity-rule "80:class_g = 'rofi'" --opacity-rule "90:class_g = 'Alacritty'" --inactive-opacity 1.00 --blur-background-exclude "class_g = 'slop'" -CGfF -o 0.70 -O 0.028 -I 0.028 -t 0 -l 0 -r 3 -D2 -m 1.00 &

setbg &
#pidof -q compfy || compfy --config $HOME/.config/compfy.conf &
sxhkd -c ~/.config/qtile/sxhkdrc &
#(sleep 2s && $HOME/.config/polybar/launch.sh) &

#dunst &                                # notification daemon

#unclutter &       # hide mouse pointer when idle


#redshift -l 47.162495:19.503304 -t 6000:3600 -g 0.8 -m randr -v &
#xrandr --output HDMI-0 --scale 2x2 --mode 1920x1080 --rotate left --output DP-0 --primary --mode 3840x2160 --pos 1080x0 --left-of HDMI-0 &
#slstatus &
/nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1 &

