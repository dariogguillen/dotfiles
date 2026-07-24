#!/usr/bin/env bash
# Aplica un wallpaper con hyprpaper por IPC, de forma fiable en el arranque.
# Uso: wallpaper.sh [ruta_imagen]   (por defecto: nord-1.jpg)
set -u
WP="${1:-$HOME/Documents/dotfiles/nixos/config/wallpapers/nord-1.jpg}"

# Arranca hyprpaper si no está corriendo.
pgrep -x hyprpaper >/dev/null || { hyprpaper >/dev/null 2>&1 & disown; }

# Espera a que hyprpaper responda por IPC (hasta ~5s).
for _ in $(seq 1 50); do
  hyprctl hyprpaper listactive >/dev/null 2>&1 && break
  sleep 0.1
done

# Precarga (ignora error si ya estaba cargada) y aplica a cada monitor conectado.
hyprctl hyprpaper preload "$WP" >/dev/null 2>&1
for m in $(hyprctl monitors | awk '/^Monitor/{print $2}'); do
  hyprctl hyprpaper wallpaper "$m,$WP" >/dev/null 2>&1
done

# Libera de RAM wallpapers no usados.
hyprctl hyprpaper unload unused >/dev/null 2>&1
exit 0
