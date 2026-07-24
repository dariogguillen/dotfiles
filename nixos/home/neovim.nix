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

    # Frontend React/TypeScript:
    vtsls                        # LSP de TS/JS (el que usa el extra lang.typescript)
    vscode-langservers-extracted # eslint, json, html, css language servers
    prettierd                    # formateo rápido (conform) para JS/TS/web

    # ── DevOps (extras: lang.docker, lang.yaml + override bash) ──
    dockerfile-language-server         # dockerls
    docker-compose-language-service   # docker_compose_language_service
    hadolint                          # linter de Dockerfile
    yaml-language-server              # yamlls (k8s/CI)
    bash-language-server              # bashls (ver lua/plugins/bash.lua)
    shfmt                             # formateo de shell

    # ── Python (extra: lang.python) ──
    pyright                     # LSP
    ruff                        # lint + format
    python3Packages.debugpy     # binario debugpy-adapter (debug de Python)

    # ── Docs y config (extras: lang.markdown, lang.toml) ──
    marksman                    # LSP de Markdown
    markdownlint-cli2           # lint de Markdown
    markdown-toc                # tabla de contenidos
    taplo                       # LSP/format de TOML

    # ── Rust (extra: lang.rust) ──
    rust-analyzer               # LSP
    cargo                       # toolchain (build/test)
    rustc

    # Metals (Scala) y scalafmt ya vienen de home/dev.nix.
  ];
}
