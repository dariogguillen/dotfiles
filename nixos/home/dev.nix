# Toolchains de desarrollo (Scala, Java, Node, Python), Docker/K8s y AWS.
{ config, lib, pkgs, ... }:

{
  # Java 21 por defecto; las otras versiones quedan accesibles por ruta
  # (útil para sbt '-java-home', Metals, IntelliJ o un .envrc por proyecto).
  #
  # Se exportan en el initContent de zsh (que SIEMPRE se sourcea) en vez de en
  # home.sessionVariables, porque estas últimas dependen de environment.d/systemd
  # y tu sesión de Hyprland no es systemd-managed (se lanza directo desde SDDM).
  programs.zsh.initContent = lib.mkOrder 550 ''
    export JAVA_HOME="${pkgs.jdk21.home}"
    export JDK8="${pkgs.jdk8.home}"
    export JDK11="${pkgs.jdk11.home}"
    export JDK17="${pkgs.jdk17.home}"
    export JDK21="${pkgs.jdk21.home}"
  '';

  home.packages = with pkgs; [
    # ── Java (por defecto 21) ──
    jdk21

    # ── Scala ──
    coursier    # 'cs' — gestor de artefactos/tools de Scala
    sbt         # build tool
    metals      # LSP de Scala (para nvim/VSCode)
    scalafmt    # formateador
    scala-cli   # scripts/proyectos rápidos de Scala

    # ── Node ──
    nodejs_22
    pnpm
    yarn

    # ── Python ──
    uv          # gestor moderno de Python (venvs/deps rápidos)

    # ── Docker ──
    docker-compose
    lazydocker

    # ── Kubernetes ──
    kubectl
    kubectx     # kubectx + kubens (cambiar contexto/namespace)
    k9s         # TUI para clústers
    kubernetes-helm

    # ── AWS ──
    awscli2
    ssm-session-manager-plugin

    # ── Build/compilación (dependencias nativas) ──
    gnumake
    gcc
    pkg-config
  ];
}
