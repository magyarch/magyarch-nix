#!/usr/bin/env bash
pactl subscribe | grep --line-buffered "sink" |
while read -r _; do
    pkill -USR1 -u "$(id -u)" -f slstatus || exit 0
done

