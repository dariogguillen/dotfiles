# Gestión de energía: perfiles power-saver / balanced / performance
# (power-profiles-daemon, como KDE) + cambio automático AC <-> batería.
{ pkgs, ... }:

{
  services.power-profiles-daemon.enable = true;

  # powerprofilesctl disponible en el PATH (para waybar y los scripts).
  environment.systemPackages = [ pkgs.power-profiles-daemon ];

  # Permitir cambiar de perfil sin autenticación (laptop personal).
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.UPower.PowerProfiles.set-profile") {
        return polkit.Result.YES;
      }
    });
  '';

  # ─── Cambio automático según la fuente de energía ──────────────────────────
  # AC conectada  -> balanced   (sube a performance a mano si lo necesitas)
  # Con batería   -> power-saver
  systemd.services.power-profile-ac = {
    description = "Perfil de energía: balanced (AC conectada)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced";
    };
  };
  systemd.services.power-profile-battery = {
    description = "Perfil de energía: power-saver (batería)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver";
    };
  };

  # udev lanza el servicio correcto cuando cambia el estado de la corriente
  # (type=Mains, online 1/0). También dispara al arrancar (evento 'add').
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", RUN+="${pkgs.systemd}/bin/systemctl --no-block start power-profile-ac.service"
    SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", RUN+="${pkgs.systemd}/bin/systemctl --no-block start power-profile-battery.service"
  '';
}
