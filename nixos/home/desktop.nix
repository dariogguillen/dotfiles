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
  # Usa el tema "global" -> ~/.config/btop/themes/global.theme, que es un symlink
  # estable a current-theme/btop.theme. Al cambiar de tema, el siguiente btop
  # que abras toma los colores nuevos.
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "global";
      theme_background = true;
      vim_keys = true;
    };
  };
  xdg.configFile."btop/themes/global.theme".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/btop.theme";

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
