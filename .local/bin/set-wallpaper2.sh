#!/usr/bin/env bash

# ---- Beállítások ----
wall_dir="$HOME/.local/bin/wallpapers/Future"
exts="jpg png jpeg webp"
waybar_pid=$(pidof waybar)

# ---- Kép kiválasztás ----
sel="$1"
if [ -z "$sel" ]; then
  sel=$(find "$wall_dir" -type f | grep -Ei "\.($exts)$" | shuf -n 1)
fi

# ---- Háttérkép beállítása (Wayland alatt swaybg-vel) ----
if command -v swaybg >/dev/null 2>&1; then
  pkill swaybg
  swaybg -i "$sel" -m fill &
elif command -v swww >/dev/null 2>&1; then
  swww img "$sel" --transition-type any --transition-duration 1
elif command -v xwallpaper >/dev/null 2>&1; then
  xwallpaper --zoom "$sel"
fi

# ---- Pywal generálás ----
wal -i "$sel" --vte -n

# ---- Ha nincs alacritty színfájl, pótoljuk ----
if [ ! -f ~/.cache/wal/colors-alacritty.yml ]; then
  cp ~/.cache/wal/colors.yml ~/.cache/wal/colors-alacritty.yml
fi

# ---- YAML -> TOML konverzió ----
if command -v yj >/dev/null 2>&1; then
  yj -tj < ~/.cache/wal/colors-alacritty.yml > ~/.cache/wal/colors-alacritty.toml
else
  echo "⚠️ Telepítsd a 'yj' csomagot a TOML konverzióhoz (pl. nix-shell -p yj)"
fi

# ---- Waybar újratöltés ----
if [ -n "$waybar_pid" ]; then
  kill -SIGUSR2 $waybar_pid
fi

# ---- Értesítés ----
notify-send -i "$sel" "🎨 Téma frissítve" "$(basename "$sel")"

