# Lector de huella (fprintd). El sensor de esta P15 es un Synaptics 06cb:00bd.
# Lo habilitamos con el driver NATIVO de libfprint; si este chip no responde al
# enrolar (algunos Synaptics requieren un driver propietario "TOD"), lo veremos
# al probar 'fprintd-enroll' y aplicaremos el plan B.
{ ... }:

{
  services.fprintd.enable = true;

  # hyprlock necesita su propia entrada en PAM para poder desbloquear. Al existir
  # esta entrada, hereda 'fprintAuth' (activado por defecto cuando fprintd está
  # habilitado), así que el bloqueo aceptará huella O contraseña.
  #
  # OJO: NO enrolamos huella en el login (tuigreet es una TUI y no muestra el
  # prompt de huella); ahí seguimos con contraseña. La huella es para sudo y
  # para hyprlock (desbloqueo de pantalla).
  security.pam.services.hyprlock = { };
}
