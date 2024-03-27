#!/usr/bin/env bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# Utilities
pidof -q compfy || compfy --config $HOME/.config/compfy.conf &
#sxhkd -c ~/.config/qtile/sxhkdrc &

dbus-update-activation-enviornment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
