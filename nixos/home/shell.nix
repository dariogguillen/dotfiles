# Shell (zsh + starship), git, direnv, fzf y utilidades base de terminal.
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;        # sugerencias (antes plugin zsh-autosuggestions)
    syntaxHighlighting.enable = true;    # resaltado (antes plugin zsh-syntax-highlighting)
    enableCompletion = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      path = "$HOME/.zsh_history";
    };

    shellAliases = {
      # Tuyos
      n = "nvim";
      c = "claude";
      ls = "eza -a --icons";
      ll = "eza -al --icons";
      lt = "eza -a --tree --level=1 --icons";
      txn = "tmuxinator new";
      txs = "tmuxinator start";
      # NixOS (reemplazan a 'update=yay')
      update = "sudo nixos-rebuild switch --flake ~/Documents/dotfiles/nixos#nixos";
      nfu = "nix flake update --flake ~/Documents/dotfiles/nixos";
      ngc = "sudo nix-collect-garbage -d"; # liberar generaciones viejas
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "dotenv" "safe-paste" ];
    };

    # Extras que en Arch tenías sueltos (guardados con 'command -v' por seguridad).
    initContent = ''
      # coursier (Scala) — binarios instalados por 'cs install'
      export PATH="$HOME/.local/share/coursier/bin:$PATH"

      # Completado de kubectl si está presente
      command -v kubectl >/dev/null && source <(kubectl completion zsh)
    '';
  };

  # Prompt Nord con starship (equivalente a spaceship, más rápido).
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;              # como SPACESHIP_PROMPT_ADD_NEWLINE=false
      palette = "nord";
      palettes.nord = {
        blue = "#81a1c1";
        cyan = "#88c0d0";
        green = "#a3be8c";
        yellow = "#ebcb8b";
        red = "#bf616a";
        purple = "#b48ead";
      };
      directory = { truncation_length = 3; style = "bold cyan"; };
      git_branch = { style = "bold purple"; };
      hostname = { ssh_only = true; };  # como SPACESHIP_HOST_SHOW=false en local
    };
  };

  # direnv + nix-direnv: entornos de dev por proyecto (ver Fase 5b).
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # fzf (Ctrl+R historial difuso) y zoxide (salto de directorios inteligente).
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # git con delta (diffs bonitos). API nueva: programs.git.settings + programs.delta.
  programs.git = {
    enable = true;
    settings = {
      user.name = "Dario Guillen";
      user.email = "guillendario@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
  programs.delta.enable = true;

  # Utilidades base de terminal.
  home.packages = with pkgs; [
    eza
    bat
    ripgrep
    fd
    jq
    yq-go
    tree
    htop
    tmux
    tmuxinator
    gh
    lazygit
    unzip
    wget
    python3
  ];
}
