# Ranger (file manager en terminal) + herramientas de previsualización.
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger

    # Dependencias para las previews de ranger (scope.sh):
    highlight          # resaltado de sintaxis de código
    ffmpegthumbnailer  # miniaturas de video
    poppler-utils      # pdftoppm -> preview de PDF
    imagemagick        # conversión/preview de imágenes
    atool              # preview de archivos comprimidos
    mediainfo          # metadatos de audio/video
  ];

  # ~/.config/ranger -> repo (config portada de tu Omarchy, previews en kitty).
  xdg.configFile."ranger".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/ranger";
}
