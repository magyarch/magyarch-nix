#!/usr/bin/env bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Elsődleges monitor — workspace-ekkel
MONITOR=DP-1 polybar --reload mainbar-hlwm &

# Másodlagos monitor — workspace nélkül
MONITOR=DP-2 polybar --reload mainbar-hlwm-secondary &

echo "Bars launched..."
