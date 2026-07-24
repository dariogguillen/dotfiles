#!/usr/bin/env bash
# Selector de tema global (estilo Omarchy).
#   theme.sh <nombre>   -> aplica ese tema
#   theme.sh            -> abre wofi para elegir
set -u
THEMES="$HOME/.config/themes"
CURRENT="$HOME/.config/current-theme"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

name="${1:-}"
if [ -z "$name" ]; then
  name=$(ls -1 "$THEMES" 2>/dev/null | wofi --dmenu --prompt "Tema") || exit 0
fi
[ -z "$name" ] && exit 0
[ -d "$THEMES/$name" ] || { notify-send "Tema" "No existe: $name"; exit 1; }

# 1) Apuntar el tema activo (symlink que todas las apps leen)
ln -sfn "$THEMES/$name" "$CURRENT"
echo "$name" > "$HOME/.config/current-theme-name"

# 2) Recargar cada app para que tome los colores nuevos
hyprctl reload >/dev/null 2>&1            # bordes de Hyprland
makoctl reload >/dev/null 2>&1            # notificaciones
pkill -USR1 kitty 2>/dev/null            # kitty recarga su config (tema incluido)
# waybar: reiniciar para re-leer el CSS importado
for p in $(pgrep waybar); do kill "$p" 2>/dev/null; done
setsid waybar >/dev/null 2>&1 < /dev/null & disown

# 3) Wallpaper del tema (si el tema trae uno)
if [ -f "$CURRENT/wallpaper.jpg" ]; then
  "$HOME/.config/hypr/scripts/wallpaper.sh" "$(readlink -f "$CURRENT/wallpaper.jpg")" >/dev/null 2>&1
fi

notify-send "Tema aplicado" "$name"
