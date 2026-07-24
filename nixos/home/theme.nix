# Tema Nord coherente para apps GTK/Qt + cursor (Fase 4b).
{ config, pkgs, ... }:

{
  # Cursor del ratón en todo el sistema (GTK, X11, Hyprland heredan estas vars).
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # Apps GTK: tema Nordic (Nord), iconos Papirus oscuro.
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # Apps Qt siguen el estilo GTK (evita que se vean claras/descuadradas).
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
