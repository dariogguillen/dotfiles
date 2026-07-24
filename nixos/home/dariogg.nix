# Configuración de Home-Manager para el usuario 'dariogg'.
# Aquí vivirán, en fases siguientes: dotfiles (Hyprland, waybar, kitty, zsh...),
# paquetes de usuario y servicios de usuario — todo declarativo y versionado.
{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./desktop.nix
    ./theme.nix
    ./shell.nix
    ./dev.nix
    ./files.nix
    ./neovim.nix
  ];

  # Datos básicos del home.
  home.username = "dariogg";
  home.homeDirectory = "/home/dariogg";

  # Versión de estado de Home-Manager (se deja fija; no subir al actualizar).
  home.stateVersion = "26.05";

  # Permite que 'home-manager' se gestione a sí mismo.
  programs.home-manager.enable = true;
}
