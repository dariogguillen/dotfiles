# Home-Manager: apps y daemons del escritorio (Fase 4a) + enlaces de config.
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar             # barra superior
    mako               # notificaciones
    libnotify          # provee 'notify-send' para probar notificaciones
    hyprpaper          # wallpaper
    hypridle           # acciones por inactividad (atenuar, bloquear, dpms, suspender)
    cliphist           # historial de portapapeles
    pavucontrol        # mezclador de audio (GUI)
    networkmanagerapplet # nm-connection-editor (al click en red)
    blueman            # gestor bluetooth (al click en el icono BT)
  ];

  # btop (monitor de sistema, al click en CPU/mem/temp de waybar).
  # color_theme "Default" + sin fondo propio => usa los colores del terminal
  # (kitty), que ya siguen el tema global. Así btop adopta el tema automáticamente.
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
      vim_keys = true;
    };
  };

  # Symlinks editables + versionados.
  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/waybar";
  xdg.configFile."kitty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/kitty";

  # Temas globales (todas las paletas). El tema activo es ~/.config/current-theme,
  # que cambia scripts/theme.sh (SUPER+SHIFT+T).
  xdg.configFile."themes".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/themes";

  # mako y el estilo de wofi leen del TEMA ACTIVO (symlink estable -> current-theme,
  # que a su vez apunta al tema elegido). Así cambian con el tema, sin include.
  xdg.configFile."mako/config".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/mako.conf";
  xdg.configFile."wofi/config".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/wofi/config";
  xdg.configFile."wofi/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/wofi.css";
}
