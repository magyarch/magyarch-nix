#!/usr/bin/env bash

# környezet elsőként, hogy minden indított program lássa
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

# shell (sáv, értesítések, háttér, ha a noctalia ezeket kezeli)
noctalia >/dev/null 2>&1 &

# vágólap
wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &
wl-paste --type text  --watch cliphist store >/dev/null 2>&1 &
wl-paste --type image --watch cliphist store >/dev/null 2>&1 &

# polkit
pidof -q polkit-mate-authentication-agent-1 || \
  /run/current-system/sw/libexec/polkit-mate-authentication-agent-1 &
