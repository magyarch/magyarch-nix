#!/usr/bin/env bash

wall_dir="$HOME/.local/bin/wallpapers/Future"
exts="jpg png webp"

list() {
  find "$1" -type f | grep -Ei "\.($(echo "$exts" | sed 's/ /|/g'))$"
}

# háttérkép beállítása Wayland vagy X11 szerint
set_wall() {
  sel="$1"
  [ -n "$sel" ] || exit 1

  if [ -n "$WAYLAND_DISPLAY" ] && command -v swaybg >/dev/null 2>&1; then
    pkill swaybg 2>/dev/null
    swaybg -i "$sel" -m fill &
  elif [ -n "$DISPLAY" ] && command -v xwallpaper >/dev/null 2>&1; then
    xwallpaper --zoom "$sel"
  else
    # fallback: ha Wayland de nincs swaybg, próbáljuk xwallpapert
    if command -v xwallpaper >/dev/null 2>&1; then
      xwallpaper --zoom "$sel"
    else
      notify-send "Nincs háttérkép-kezelő!" "Telepítsd a swaybg vagy xwallpaper programot."
      exit 1
    fi
  fi
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


