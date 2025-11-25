#!/usr/bin/env bash

set +e

wlr-randr --output DP-2 --mode 2560x1440@144 --scale 1.25 >/dev/null 2>&1 &

# wallpaper
swaybg -i ~/.config/mango/wallpaper/xy.png >/dev/null 2>&1 &

# top bar
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css >/dev/null 2>&1 &

xwayland-satellite :11 &
# xwayland dpi scale
#echo "Xft.dpi: 144" | xrdb -merge #dpi缩放
# xrdb merge ~/.Xresources >/dev/null 2>&1

# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &

# clipboard content manager
wl-paste --type text --watch cliphist store >/dev/null 2>&1 &

mako >/dev/null 2>&1 &

/nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1 >/dev/null 2>&1 &

