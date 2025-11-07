#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/waybar/config"
STYLE="$HOME/.config/hypr/waybar/style.css"

# Hash függvény
file_hash() {
    sha1sum "$1" 2>/dev/null | awk '{print $1}'
}

# Első hash értékek
LAST_CONFIG_HASH=$(file_hash "$CONFIG")
LAST_STYLE_HASH=$(file_hash "$STYLE")

start_waybar() {
    pkill -x waybar 2>/dev/null
    sleep 0.3
    waybar -c "$CONFIG" -s "$STYLE" &
    echo "[waybar-poll] Waybar újraindítva: $(date)"
}

# Első indítás
start_waybar

# Figyelő loop
while true; do
    sleep 2  # ellenőrzési gyakoriság (másodperc)
    NEW_CONFIG_HASH=$(file_hash "$CONFIG")
    NEW_STYLE_HASH=$(file_hash "$STYLE")

    if [[ "$NEW_CONFIG_HASH" != "$LAST_CONFIG_HASH" || "$NEW_STYLE_HASH" != "$LAST_STYLE_HASH" ]]; then
        LAST_CONFIG_HASH="$NEW_CONFIG_HASH"
        LAST_STYLE_HASH="$NEW_STYLE_HASH"
        start_waybar
    fi
done
    
