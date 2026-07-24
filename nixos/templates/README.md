# Plantillas direnv (entornos por proyecto)

El sustituto de nvm/sdkman en NixOS. Copia lo que necesites a la raíz de un
proyecto y ejecuta `direnv allow` una vez.

## Patrón 1 — Ligero (solo cambiar de JDK)

Cuando solo necesitas otra versión de Java (ya tienes `$JDK8/$JDK11/$JDK17/$JDK21`
exportadas por tu zsh). Copia `jdk/.envrc` al proyecto y ajusta la versión:

```bash
cp ~/Documents/dotfiles/nixos/templates/jdk/.envrc mi-proyecto/.envrc
cd mi-proyecto && direnv allow
```

## Patrón 2 — Dev shell reproducible (flake)

Cuando quieres versiones concretas de Node/Scala/Python/etc. declaradas y
reproducibles para todo tu equipo. Copia el `flake.nix` + `.envrc` de la
plantilla que aplique (`node/`, `scala/`):

```bash
cp ~/Documents/dotfiles/nixos/templates/node/{flake.nix,.envrc} mi-proyecto/
cd mi-proyecto && direnv allow      # la 1a vez construye el entorno (luego es instantáneo)
```

Edita el `flake.nix` para añadir/quitar herramientas. `nix-direnv` cachea, así
que tras la primera vez entrar a la carpeta es inmediato.

> Nota: si el proyecto es un repo git, añade `.direnv/` a su `.gitignore`.
