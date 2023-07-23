#!/bin/sh -e

cd ~/.local/bin/wallpapers/Future/

img=$(printf '%s\n' * | dmenu -p 'Fill: ' -nb '#2f2b26' -sb '#2e8b57' -fn 'JetBrains Mono Medium-12' -w '760' -h '24' -x '574' -y '48')

[ -f "$img" ] && feh --bg-fill "$img" && notify-send "Style: fill" && notify-send "File: $img"
