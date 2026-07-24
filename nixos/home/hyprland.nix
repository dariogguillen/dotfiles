# Home-Manager: enlaza tu config de Hyprland (editable + versionada) e instala
# las apps de usuario del entorno. El binario de Hyprland lo da el sistema.
{ config, lib, pkgs, ... }:

{
  # ~/.config/hypr  ->  ~/Documents/dotfiles/nixos/config/hypr  (symlink editable en vivo).
  # mkOutOfStoreSymlink apunta al archivo REAL del repo, no a una copia en el store,
  # así puedes editar y hacer 'hyprctl reload' sin reconstruir.
  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/hypr";

  # Apps de usuario del entorno Hyprland (más llegarán en la Fase 4).
  home.packages = with pkgs; [
    wofi      # lanzador de aplicaciones (SUPER+SPACE)
    hyprlock  # bloqueo de pantalla (SUPER+CTRL+ESC)
  ];
}
