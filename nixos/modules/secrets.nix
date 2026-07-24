# Gestión de secretos con sops-nix.
#
# Modelo: los secretos viven CIFRADOS en el repo (secrets/secrets.yaml). Solo
# esta máquina, con su clave privada age en /var/lib/sops-nix/key.txt, puede
# descifrarlos. Al arrancar, NixOS los descifra a /run/secrets/... (tmpfs en RAM).
#
# ── ETAPA 1 (actual): solo herramientas ──
# Aún NO declaramos secretos ni defaultSopsFile (eso rompería el build hasta que
# exista secrets.yaml). Primero generamos la clave y creamos el archivo cifrado;
# luego, en la etapa 2, activamos sops.defaultSopsFile y sops.secrets.
{ pkgs, ... }:

{
  # Herramientas para crear/editar secretos y manejar claves age.
  environment.systemPackages = with pkgs; [
    sops         # editor/cifrador de secretos
    age          # criptografía de clave (genera el par de claves)
    ssh-to-age   # (opcional) convierte claves SSH a age, por si algún día
  ];

  # Ruta de la clave PRIVADA que descifra en el arranque (fuera de git).
  # La generaremos a mano en la etapa 2; aquí solo fijamos dónde vivirá.
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
}
