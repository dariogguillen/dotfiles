# tmux — portado de tu tmux.conf de Omarchy. Plugins vía Nix (sin TPM).
{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-a";           # unbind C-b + prefix C-a + send-prefix (automático)
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    escapeTime = 10;
    terminal = "tmux-256color";
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator      # navegación Ctrl+hjkl integrada con nvim
      yank                    # copiar al portapapeles (usa wl-clipboard)
      {
        plugin = tmux-floax;  # panel flotante (prefix + p)
        extraConfig = ''
          set -g @floax-width '50%'
          set -g @floax-height '50%'
          set -g @floax-border-color 'gray'
          set -g @floax-text-color '#cccccc'
        '';
      }
    ];

    extraConfig = ''
      # ── Atajos extra ─────────────────────────────────────────────────────
      bind-key -n C-t new-window
      bind-key -n C-w confirm-before -p "kill-pane #P? (y/n)" kill-pane

      set -g pane-base-index 1
      set -g renumber-windows on

      # Dividir paneles (| y _ mantienen el directorio actual)
      bind \\ split-window -h
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v
      bind _ split-window -v -c "#{pane_current_path}"

      # Recargar config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded config"

      # ── Terminal / clipboard / teclas extendidas (kitty) ─────────────────
      set -ag terminal-overrides ",*:RGB"
      set -g focus-events on
      set -g set-clipboard on
      set -g allow-passthrough on
      setw -g aggressive-resize on
      set -g detach-on-destroy off
      set -g extended-keys on
      set -g extended-keys-format csi-u
      set -ag terminal-features "xterm-kitty:extkeys"

      # Integración con vim-tmux (sin resize automático)
      set -g @tmux-nvim-resize false

      # ── Barra de estado / tema (Nord / azul) ─────────────────────────────
      set -g status-position bottom
      set -g status-interval 5
      set -g status-left-length 30
      set -g status-right-length 50
      set -g window-status-separator ""
      set -gw automatic-rename on
      set -gw automatic-rename-format '#{b:pane_current_path}'
      set -g set-titles on
      set -g set-titles-string '#h:#W'

      set -g status-style "bg=default,fg=default"
      set -g status-left "#[fg=black,bg=blue,bold] #S #[bg=default] "
      set -g status-right "#[fg=blue]#{?pane_in_mode,COPY ,}#{?client_prefix,PREFIX ,}#{?window_zoomed_flag,ZOOM ,}#[fg=brightblack]#h "
      set -g window-status-format "#[fg=brightblack] #I:#W "
      set -g window-status-current-format "#[fg=blue,bold] #I:#W "
      set -g pane-border-style "fg=brightblack"
      set -g pane-active-border-style "fg=blue"
      set -g message-style "bg=default,fg=blue"
      set -g message-command-style "bg=default,fg=blue"
      set -g mode-style "bg=blue,fg=black"
      setw -g clock-mode-colour blue
    '';
  };
}
