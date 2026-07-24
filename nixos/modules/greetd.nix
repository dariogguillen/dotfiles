# Login TUI (estilo terminal) con greetd + tuigreet, en lugar de SDDM.
{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      # tuigreet: login en modo texto.
      #  --time            muestra la hora
      #  --remember        recuerda el último usuario
      #  --remember-session recuerda la última sesión elegida
      #  --sessions        de dónde leer las sesiones (Hyprland lo registra ahí)
      command = "${lib.getExe pkgs.tuigreet} --time --remember --remember-session "
        + "--sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      user = "greeter";
    };
  };
}
