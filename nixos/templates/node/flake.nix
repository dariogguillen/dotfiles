{
  description = "Dev shell del proyecto (Node)";

  # Fijado a la misma rama que tu sistema para no descargar de más.
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        # Herramientas disponibles SOLO dentro de este proyecto.
        packages = with pkgs; [
          nodejs_20      # <- versión de Node de ESTE proyecto (cambia a la que necesites)
          pnpm
          # yarn
          # typescript
        ];

        shellHook = ''
          echo "→ Entorno del proyecto (Node $(node --version))"
        '';
      };
    };
}
