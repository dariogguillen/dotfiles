# Gestión de secretos con sops-nix.
#
# Modelo: los secretos viven CIFRADOS en el repo (secrets/secrets.yaml). Solo
# esta máquina, con su clave privada age en /var/lib/sops-nix/key.txt, puede
# descifrarlos. Al arrancar, NixOS los descifra a /run/secrets/... (tmpfs en RAM).
#
{ config, pkgs, ... }:

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

  # ── Credenciales AWS ────────────────────────────────────────────────────────
  # Las dos partes de la credencial, cada una un secreto cifrado.
  sops.secrets.aws_access_key_id = { };
  sops.secrets.aws_secret_access_key = { };

  # Un TEMPLATE combina varios secretos en un archivo con formato. Aquí armamos
  # el ~/.aws/credentials en formato INI. ${config.sops.placeholder.X} es un
  # marcador que sops-nix sustituye por el valor descifrado AL ARRANCAR (el valor
  # real nunca aparece en /nix/store ni en git, solo el marcador).
  sops.templates."aws-credentials" = {
    content = ''
      [default]
      aws_access_key_id = ${config.sops.placeholder.aws_access_key_id}
      aws_secret_access_key = ${config.sops.placeholder.aws_secret_access_key}
    '';
    owner = "dariogg";
  };

  # El aws CLI y los SDKs leen las credenciales de la ruta que indique esta
  # variable oficial. La apuntamos al archivo renderizado (en /run, tmpfs).
  environment.sessionVariables.AWS_SHARED_CREDENTIALS_FILE =
    config.sops.templates."aws-credentials".path;
}
