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

  # ─── Suspensión e hibernación ──────────────────────────────────────────────
  # Partición swap (64GB > 62GB de RAM), así que la hibernación es viable: el
  # kernel vuelca la RAM aquí y la restaura al encender.
  boot.resumeDevice = "/dev/disk/by-uuid/703058ae-6be6-4b9c-89fc-c6c6a821d2b8";

  # 'suspend-then-hibernate' = suspende (RAM, arranque instantáneo) y, si sigues
  # sin usarla un rato, pasa a hibernar (apagado real, cero batería, conserva la
  # sesión). Lo mejor de ambos: rápido al volver pronto, seguro si la dejas horas.
  systemd.sleep.settings.Sleep.HibernateDelaySec = "30min";

  # Comportamiento al cerrar la tapa según el escenario:
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";              # con batería
    HandleLidSwitchExternalPower = "suspend-then-hibernate"; # con cargador
    HandleLidSwitchDocked = "ignore";                        # con monitor/dock: no dormir
  };

  # ─── Control térmico del i9-10980HK ────────────────────────────────────────
  # thermald monitorea la temperatura y ajusta el CPU antes de que el hardware
  # tenga que estrangularse de golpe (throttling brusco). Importa al compilar
  # Scala/Java, que calienta bastante en este chip.
  services.thermald.enable = true;
}
