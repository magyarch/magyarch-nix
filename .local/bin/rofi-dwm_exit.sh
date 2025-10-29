#!/usr/bin/env bash
# Egyszerű rofi power menu dwm-hez

choice=$(echo -e "Logout\nReboot\nShutdown" | rofi -dmenu -i -p "dwm:")

case "$choice" in
  Logout)   pkill -TERM dwm ;;        # kiléptet dwm-ből
  Reboot)   systemctl reboot ;;       # rendszer újraindítás
  Shutdown) systemctl poweroff ;;     # rendszer kikapcsolás
esac

