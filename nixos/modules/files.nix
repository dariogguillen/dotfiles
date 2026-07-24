# File manager gráfico ligero (Thunar) + soporte de montaje y miniaturas.
{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman          # montaje automático de USB/unidades
      thunar-archive-plugin  # comprimir/extraer desde el menú
    ];
  };

  services.gvfs.enable = true;    # montar unidades, papelera, red (smb/mtp)
  services.tumbler.enable = true; # generación de miniaturas
}
