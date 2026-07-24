# NVIDIA híbrida (Optimus) para ThinkPad P15 Gen 1:
#   iGPU Intel UHD (PCI:0:2:0)  +  dGPU NVIDIA Quadro T1000/T2000 (Turing, PCI:1:0:0)
#
# Base       = PRIME Offload  -> Intel dibuja, NVIDIA bajo demanda (batería).
# 'docked'   = PRIME Sync     -> NVIDIA dibuja todo (monitor externo + potencia),
#                               como entrada aparte en el menú de arranque.
{ config, lib, pkgs, ... }:

{
  # Usar el driver NVIDIA para X/Wayland.
  services.xserver.videoDrivers = [ "nvidia" ];

  # Aceleración gráfica (OpenGL/Vulkan/VA-API), con soporte 32-bit.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    # Imprescindible para Wayland/Hyprland (activa nvidia-drm.modeset=1).
    modesetting.enable = true;

    # Gestión de energía + apagado de la dGPU cuando no se usa (modo offload).
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Módulos de kernel open-source de NVIDIA (recomendado para Turing+ y ya
    # validado en tu hardware bajo Omarchy). Si hubiera problemas -> false.
    open = true;

    # Deja disponible la utilidad nvidia-settings.
    nvidiaSettings = true;

    # El paquete del driver, atado a tu kernel actual (usamos la rama estable).
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

      # Perfil por defecto: OFFLOAD (batería).
      offload = {
        enable = true;
        # Instala el wrapper 'nvidia-offload <programa>' para lanzar apps
        # concretas en la GPU NVIDIA cuando lo necesites.
        enableOffloadCmd = true;
      };
    };
  };

  # ─── Perfil alterno "docked" = PRIME Sync ──────────────────────────────────
  # Aparece como entrada extra en el menú de systemd-boot. Úsala cuando estés
  # con monitor externo y enchufado.
  specialisation."docked".configuration = {
    # Etiqueta que se ve en el nombre de la generación / arranque.
    system.nixos.tags = [ "docked" ];

    hardware.nvidia = {
      # Apagamos offload y encendemos sync. mkForce = "ignora el valor base y
      # usa este a la fuerza" (resuelve el conflicto entre base y specialisation).
      prime.offload.enable = lib.mkForce false;
      prime.offload.enableOffloadCmd = lib.mkForce false;
      prime.sync.enable = lib.mkForce true;

      # En sync la dGPU está siempre activa, así que el apagado fino no aplica.
      powerManagement.finegrained = lib.mkForce false;
    };
  };
}
