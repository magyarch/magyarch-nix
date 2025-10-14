#!/usr/bin/env bash
expr=$(wofi --dmenu -p "Számítás:")
[ -z "$expr" ] && exit 0

result=$(echo "$expr" | bc -l 2>/dev/null)
notify-send "🧮 Számítás" "$expr = $result"

