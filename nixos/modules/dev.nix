# Ajustes de sistema para desarrollo: Docker y zsh como shell de login.
{ pkgs, ... }:

{
  # Docker (rootful). El usuario ya está en el grupo 'docker' (configuration.nix),
  # así que puede usar 'docker' sin sudo.
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true; # limpia imágenes/volúmenes colgados periódicamente
  };

  # zsh a nivel de sistema + como shell por defecto de tu usuario.
  # (La CONFIGURACIÓN de zsh la hace home-manager en home/shell.nix.)
  programs.zsh.enable = true;
  users.users.dariogg.shell = pkgs.zsh;
}
