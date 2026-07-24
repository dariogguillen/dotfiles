# Neovim / LazyVim. El binario neovim viene del sistema (configuration.nix).
# Aquí enlazamos tu config y proveemos por Nix las herramientas que en Arch
# instalaba Mason (deshabilitado en NixOS — ver lua/plugins/nixos.lua).
{ config, pkgs, ... }:

{
  # ~/.config/nvim -> tu LazyVim en el repo (editable en vivo + versionado).
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/lazyvim";

  home.packages = with pkgs; [
    # LSP / formatters (van al PATH; LazyVim los usa vía nvim-lspconfig/conform)
    lua-language-server
    stylua
    nixd                 # LSP para editar tu propia config .nix
    nixfmt               # formateador Nix (RFC style)
    google-java-format   # formateo de Java (ver lua/plugins/java.lua)

    # Treesitter compila sus parsers con gcc (ya en dev.nix); su CLI:
    tree-sitter

    # Metals (Scala) y scalafmt ya vienen de home/dev.nix.
  ];
}
