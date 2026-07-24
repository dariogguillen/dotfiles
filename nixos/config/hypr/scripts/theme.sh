#!/usr/bin/env bash
# Selector de tema global (estilo Omarchy).
#   theme.sh <nombre>   -> aplica ese tema
#   theme.sh            -> abre wofi (compacto, con punto del color de acento)
set -u
THEMES="$HOME/.config/themes"
CURRENT="$HOME/.config/current-theme"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# Construye el menú: "<punto color acento>  nombre" por cada tema.
menu() {
  for t in $(ls -1 "$THEMES" 2>/dev/null); do
    [ -d "$THEMES/$t" ] || continue
    acc=$(grep -oiE 'accent[[:space:]]+#[0-9a-f]{6}' "$THEMES/$t/waybar.css" 2>/dev/null \
      | grep -oiE '#[0-9a-f]{6}' | head -1)
    [ -z "$acc" ] && acc="#ffffff"
    printf '<span foreground="%s">●</span>  %s\n' "$acc" "$t"
  done
}

name="${1:-}"
if [ -z "$name" ]; then
  sel=$(menu | wofi --dmenu --allow-markup --prompt "Tema" --width 300 --lines 6) || exit 0
  name=$(printf '%s' "$sel" | awk '{print $NF}')
fi
[ -z "$name" ] && exit 0
[ -d "$THEMES/$name" ] || { notify-send "Tema" "No existe: $name"; exit 1; }

# 1) Apuntar el tema activo (symlink que todas las apps leen)
ln -sfn "$THEMES/$name" "$CURRENT"
echo "$name" > "$HOME/.config/current-theme-name"

# 2) Recargar cada app para que tome los colores nuevos
hyprctl reload >/dev/null 2>&1                    # bordes de Hyprland
makoctl reload >/dev/null 2>&1                    # notificaciones
pkill -USR1 kitty 2>/dev/null                     # kitty recarga su config (tema incluido)
systemctl --user restart waybar >/dev/null 2>&1   # waybar (servicio systemd) relee el CSS

# 3) Wallpaper del tema (si el tema trae uno)
if [ -f "$CURRENT/wallpaper.jpg" ]; then
  "$HOME/.config/hypr/scripts/wallpaper.sh" "$(readlink -f "$CURRENT/wallpaper.jpg")" >/dev/null 2>&1
fi

notify-send "Tema aplicado" "$name"
