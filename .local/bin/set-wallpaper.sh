#!/usr/bin/env bash

wall_dir="$HOME/.local/bin/wallpapers/Future"
exts="jpg png webp"

list() {
  find "$1" -type f | grep -Ei "\.($(echo "$exts" | sed 's/ /|/g'))$"
}

set_wall() {
  sel="$1"
  [ -n "$sel" ] || exit 1
  pkill swaybg 2>/dev/null
  swaybg -i "$sel" -m fill &
}

# wofi mód
if [ "$1" = "wofi" ]; then
  sel="$(list "$wall_dir" | shuf | wofi --dmenu)"
  [ -n "$sel" ] && set_wall "$sel"
  exit
fi

# random mód
if [ "$1" = "--random" ]; then
  sel="$(list "$wall_dir" | shuf -n 1)"
  set_wall "$sel"
  exit
fi

# ha fájl
if [ -f "$1" ]; then
  set_wall "$1"
  exit
fi

# ha mappa
if [ -d "$1" ]; then
  sel="$(list "$1" | shuf -n 1)"
  set_wall "$sel"
  exit
fi

# nsxiv választó
sel="$(list "$wall_dir" | shuf | nsxiv -to - | head -n1)"
[ -n "$sel" ] && set_wall "$sel"


