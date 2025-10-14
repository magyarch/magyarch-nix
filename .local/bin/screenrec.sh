#!/usr/bin/env bash

# Képernyőfelvétel indítása / leállítása Wofi-val
# Mentés helye:
OUTDIR="$HOME/Videók"
mkdir -p "$OUTDIR"

CHOICE=$(printf "🎥 Felvétel indítása\n🛑 Felvétel leállítása" | wofi --dmenu -p "Képernyőfelvétel")

if [[ "$CHOICE" == "🎥 Felvétel indítása" ]]; then
    if pgrep -x wf-recorder >/dev/null; then
        notify-send "Már fut a felvétel!"
        exit 0
    fi
    FILE="$OUTDIR/recording_$(date +%Y-%m-%d_%H-%M-%S).mkv"
    notify-send "🎥 Felvétel elindítva" "$FILE"
    wf-recorder --codec h264_vaapi -f "$FILE" &
    disown
elif [[ "$CHOICE" == "🛑 Felvétel leállítása" ]]; then
    if pgrep -x wf-recorder >/dev/null; then
        pkill -INT wf-recorder
        notify-send "🛑 Felvétel leállítva"
    else
        notify-send "❌ Nem fut felvétel"
    fi
fi

