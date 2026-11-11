#!/usr/bin/env bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

# Utilities
run nm-applet &
blueman-applet &
/nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1 &




