# Home-Manager: apps y daemons del escritorio (Fase 4a) + enlaces de config.
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar             # barra superior
    mako               # notificaciones
    libnotify          # provee 'notify-send' para probar notificaciones
    hyprpaper          # wallpaper
    hypridle           # acciones por inactividad (atenuar, bloquear, dpms, suspender)
    cliphist           # historial de portapapeles
    pavucontrol        # mezclador de audio (GUI)
    networkmanagerapplet # nm-connection-editor (al click en red)
    blueman            # gestor bluetooth (al click en el icono BT)
    hyprshot           # capturas (región/ventana/monitor) -> archivo + portapapeles
    swappy             # editor de anotación de capturas (Ctrl+Print)
  ];

  # Carpeta de capturas (hyprshot la recibe con -o en los binds; swappy la usa
  # como save_dir). El .keep asegura que exista aunque esté vacía.
  home.file."Pictures/Screenshots/.keep".text = "";

  # ── waybar y mako como servicios de usuario de systemd ──────────────────────
  # Ventaja sobre 'exec-once': si el proceso muere (crash, tras dormir/despertar),
  # systemd lo reinicia solo. Atados a graphical-session.target -> arrancan y
  # paran con la sesión de Hyprland (uwsm). Ya NO se lanzan desde autostart.conf.
  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar (barra superior)";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      # Recarga en caliente (SIGUSR2) sin matar el proceso.
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services.mako = {
    Unit = {
      Description = "mako (notificaciones)";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      # Activado por D-Bus: mako toma el nombre del servicio de notificaciones.
      Type = "dbus";
      BusName = "org.freedesktop.Notifications";
      ExecStart = "${pkgs.mako}/bin/mako";
      ExecReload = "${pkgs.mako}/bin/makoctl reload";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # swappy (editor de capturas): dónde guarda al pulsar el botón/atajo de guardar.
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=${config.home.homeDirectory}/Pictures/Screenshots
    save_filename_format=captura_%Y%m%d_%H%M%S.png
    show_panel=true
    early_exit=false
  '';

  # btop (monitor de sistema, al click en CPU/mem/temp de waybar).
  # Usa el tema "global" -> ~/.config/btop/themes/global.theme, que es un symlink
  # estable a current-theme/btop.theme. Al cambiar de tema, el siguiente btop
  # que abras toma los colores nuevos.
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "global";
      theme_background = true;
      vim_keys = true;
    };
  };
  xdg.configFile."btop/themes/global.theme".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/btop.theme";

  # Symlinks editables + versionados.
  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/waybar";
  xdg.configFile."kitty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/kitty";

  # Temas globales (todas las paletas). El tema activo es ~/.config/current-theme,
  # que cambia scripts/theme.sh (SUPER+SHIFT+T).
  xdg.configFile."themes".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/themes";

  # mako y el estilo de wofi leen del TEMA ACTIVO (symlink estable -> current-theme,
  # que a su vez apunta al tema elegido). Así cambian con el tema, sin include.
  xdg.configFile."mako/config".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/mako.conf";
  xdg.configFile."wofi/config".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/dotfiles/nixos/config/wofi/config";
  xdg.configFile."wofi/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/current-theme/wofi.css";
}
