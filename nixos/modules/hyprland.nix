# Hyprland a nivel de sistema: compositor, sesión (SDDM), portales y utilidades.
# La configuración personal (dotfiles) la gestiona home-manager por symlink.
{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # compatibilidad con apps X11 (ej. algunas de dev)
    withUWSM = true;        # lanza Hyprland como sesión gestionada por systemd
  };

  # uwsm: envuelve el compositor en una sesión systemd (graphical-session.target),
  # así se propagan bien las variables de entorno (environment.d / sessionVariables).
  programs.uwsm.enable = true;

  # Portales XDG: file pickers, screen-share, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Variables de entorno seguras para Wayland a nivel de sesión.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Electron/Chromium usan Wayland nativo
  };

  # Utilidades base del entorno (clipboard, screenshots, brillo, media).
  environment.systemPackages = with pkgs; [
    wl-clipboard
    grim
    slurp
    brightnessctl
    playerctl
  ];

  # Agente polkit de Hyprland: registra su servicio de usuario para que
  # 'systemctl --user start hyprpolkitagent.service' (en autostart) funcione.
  security.polkit.enable = true;
  systemd.packages = [ pkgs.hyprpolkitagent ];

  # Bluetooth (el icono de waybar abre blueman-manager).
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
