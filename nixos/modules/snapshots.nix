# Snapshots automáticos de /home con snapper (Btrfs). Red de seguridad a nivel
# de archivos: si borras/rompes algo, recuperas del snapshot. Complementa a las
# generaciones de NixOS (que cubren el SISTEMA, no tus datos en /home).
#
# El sistema (/) ya está versionado por las generaciones, y /nix es enorme y
# reconstruible, así que solo snapshotamos /home (tu trabajo irremplazable).
#
# ⚠️  PASO MANUAL ÚNICO antes del primer rebuild con esto:
#     sudo btrfs subvolume create /home/.snapshots
#     sudo chmod 750 /home/.snapshots
#   (snapper exige que el subvolumen contenga un subvol '.snapshots'; NixOS no
#    lo crea automáticamente.)
{ ... }:

{
  services.snapper.configs.home = {
    SUBVOLUME = "/home";

    # dariogg puede listar/restaurar sin sudo; SYNC_ACL ajusta permisos para ello.
    ALLOW_USERS = [ "dariogg" ];
    SYNC_ACL = true;

    # Snapshots automáticos por tiempo (snapper-timeline.timer) + limpieza.
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;

    # Cuántos conservar de cada franja (Btrfs CoW: ocupan solo lo que cambia).
    TIMELINE_LIMIT_HOURLY = 6;    # últimas 6 horas
    TIMELINE_LIMIT_DAILY = 7;     # últimos 7 días
    TIMELINE_LIMIT_WEEKLY = 4;    # últimas 4 semanas
    TIMELINE_LIMIT_MONTHLY = 0;
    TIMELINE_LIMIT_YEARLY = 0;
  };
}
