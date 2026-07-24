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

    # LSP de Java (jdtls). El extra de Java de LazyVim lo toma del PATH con
    # vim.fn.exepath("jdtls"); las partes de Mason se saltan (Mason off).
    jdt-language-server

    # Treesitter compila sus parsers con gcc (ya en dev.nix); su CLI:
    tree-sitter

    # Adaptador de debug JS/TS (reemplaza el build-desde-fuente que falla en NixOS).
    # Provee el binario 'js-debug' en el PATH (ver lua/plugins/dap.lua).
    vscode-js-debug

    # Metals (Scala) y scalafmt ya vienen de home/dev.nix.
  ];
}
