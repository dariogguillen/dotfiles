# Gestión de secretos con sops-nix.
#
# Modelo: los secretos viven CIFRADOS en el repo (secrets/secrets.yaml). Solo
# esta máquina, con su clave privada age en /var/lib/sops-nix/key.txt, puede
# descifrarlos. Al arrancar, NixOS los descifra a /run/secrets/... (tmpfs en RAM).
#
{ pkgs, ... }:

{
  # Herramientas para crear/editar secretos y manejar claves age.
  environment.systemPackages = with pkgs; [
    sops         # editor/cifrador de secretos
    age          # criptografía de clave (genera el par de claves)
    ssh-to-age   # (opcional) convierte claves SSH a age, por si algún día
  ];

  # Ruta de la clave PRIVADA que descifra en el arranque (fuera de git).
  # La ponemos en ~/.config/sops/age/ (la ruta por defecto del comando 'sops'),
  # así editas secretos SIN sudo y root la lee al arrancar. mode 600, tu usuario.
  sops.age.keyFile = "/home/dariogg/.config/sops/age/keys.txt";

  # Archivo cifrado por defecto del que salen los secretos.
  sops.defaultSopsFile = ../secrets/secrets.yaml;

  # ── Secretos declarados ──
  # Cada uno se descifra al arrancar a /run/secrets/<nombre> (tmpfs, en RAM).
  # owner = "dariogg" -> lo puedes leer sin sudo (por defecto sería solo root).
  sops.secrets.ejemplo = {
    owner = "dariogg";
  };
}
