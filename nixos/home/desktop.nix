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
    btop               # monitor de sistema (al click en CPU/mem de waybar)
    networkmanagerapplet # nm-connection-editor (al click en red)
    blueman            # gestor bluetooth (al click en el icono BT)
  ];

  # Symlinks editables + versionados (mismo patrón que hypr).
  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/waybar";
  xdg.configFile."mako".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/mako";
  xdg.configFile."kitty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/kitty";
  xdg.configFile."wofi".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/wofi";
}
