#!/usr/bin/env bash
# Selector de perfil de energía (wofi). Se abre al click en la batería de waybar.
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

cur=$(powerprofilesctl get 2>/dev/null || echo "?")
sel=$(printf 'power-saver\nbalanced\nperformance\n' \
  | wofi --dmenu --prompt "Perfil ($cur)" --width 260 --lines 5) || exit 0

[ -z "$sel" ] && exit 0
powerprofilesctl set "$sel" && notify-send "Perfil de energía" "$sel"
