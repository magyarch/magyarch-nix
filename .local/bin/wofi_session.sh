#!/usr/bin/env bash
set -euo pipefail

terminal="alacritty"
repos_dir="$HOME/repos"

echo "== Debug: repos_dir = $repos_dir"

if [ ! -d "$repos_dir" ]; then
  echo "Nincs ilyen mappa: $repos_dir"
  notify-send "Nincs ilyen mappa: $repos_dir"
  exit 1
fi

echo "== Debug: keresem a mappákat..."
configs=$(find "$repos_dir" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
echo "== Debug: configs ="
echo "$configs"

if [ -z "$configs" ]; then
  echo "Nincs repo a $repos_dir alatt"
  notify-send "Nincs repo a $repos_dir alatt"
  exit 0
fi

echo "== Debug: wofi indítása..."
chosen=$(printf '%s\n' "$configs" | wofi -dmenu -p 'Projects:')

echo "== Debug: chosen = '$chosen'"

if [ -z "$chosen" ]; then
  echo "Nem választottál semmit"
  notify-send "Nem választottál semmit"
  exit 0
fi

dir="$repos_dir/$chosen"
echo "== Debug: dir = $dir"

# Ellenőrzés: létezik-e
if [ ! -d "$dir" ]; then
  echo "A kiválasztott könyvtár nem létezik: $dir"
  notify-send "Hiba" "A mappa nem létezik: $dir"
  exit 1
fi

notify-send "Projekt indítása" "$chosen"
echo "== Debug: Alacritty indítása..."
exec "$terminal" -e tmux new-session -As "$chosen" -c "$dir"

