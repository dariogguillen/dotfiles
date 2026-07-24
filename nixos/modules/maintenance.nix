# Mantenimiento automático del sistema: recolección de basura de Nix,
# deduplicación del store y TRIM del SSD. Evita que /nix/store crezca sin
# control y que se acumulen entradas de arranque de generaciones viejas.
{ ... }:

{
  # ─── Recolección de basura ─────────────────────────────────────────────────
  # Cada 'rebuild' crea una GENERACIÓN nueva (para poder hacer rollback). Con el
  # tiempo se acumulan y ocupan disco + llenan el menú de arranque. Esto borra
  # semanalmente las que tengan más de 14 días (siempre conservas las recientes).
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Deduplica archivos idénticos en /nix/store usando hardlinks. Muchos paquetes
  # comparten archivos iguales; esto puede ahorrar varios GB sin que notes nada.
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  # TRIM periódico del SSD NVMe: avisa al disco qué bloques están libres, lo que
  # mantiene el rendimiento y la vida útil de las celdas.
  services.fstrim.enable = true;
}
