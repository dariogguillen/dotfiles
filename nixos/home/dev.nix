# Toolchains de desarrollo (Scala, Java, Node, Python), Docker/K8s y AWS.
{ config, lib, pkgs, ... }:

{
  # Java 21 por defecto; las otras versiones accesibles por $JDK8/$JDK11/$JDK17
  # (útil para sbt '-java-home', Metals, IntelliJ o un .envrc por proyecto).
  #
  # Con uwsm la sesión es systemd-managed, así que environment.d propaga estas
  # variables a TODAS las apps (terminales y GUI). Requiere re-login para aplicar.
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk21.home}";
    JDK8  = "${pkgs.jdk8.home}";
    JDK11 = "${pkgs.jdk11.home}";
    JDK17 = "${pkgs.jdk17.home}";
    JDK21 = "${pkgs.jdk21.home}";
  };

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
    # nodejs_24 trae npm 11.16 (nodejs_22 traía npm 10.9, insuficiente para
    # proyectos que piden npm>=11.7). En NixOS npm va atado a la versión de node.
    nodejs_24
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
