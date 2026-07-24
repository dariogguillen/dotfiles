{
  # Una descripción corta y libre de este flake.
  description = "NixOS - ThinkPad P15 Gen 1 (dariogg)";

  # INPUTS = de dónde sacamos el código. Cada uno queda fijado en flake.lock.
  inputs = {
    # El repo de paquetes de NixOS, rama estable 26.05.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home-Manager, con su rama que casa con 26.05.
    # 'follows' obliga a home-manager a usar EXACTAMENTE el mismo nixpkgs que
    # el sistema, evitando duplicar/mezclar versiones.
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # OUTPUTS = lo que este flake produce. Recibe las inputs ya resueltas.
  # El '@inputs' captura todas juntas para pasarlas a los módulos.
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      # Definimos UNA configuración de sistema llamada "nixos" (= tu hostname).
      # Se construye con: nixos-rebuild switch --flake ~/Documents/dotfiles/nixos#nixos
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        # specialArgs hace que 'inputs' esté disponible dentro de cualquier
        # módulo (útil cuando un módulo necesita otra input, ej. un flake extra).
        specialArgs = { inherit inputs; };

        # La lista de módulos que componen el sistema. NixOS los fusiona todos.
        modules = [
          # Tu configuración principal del sistema.
          ./configuration.nix

          # Enchufamos Home-Manager como módulo del sistema...
          home-manager.nixosModules.home-manager
          {
            # ...y lo configuramos:
            home-manager.useGlobalPkgs = true;      # usa el mismo nixpkgs del sistema
            home-manager.useUserPackages = true;    # instala paquetes de usuario en el sistema
            home-manager.backupFileExtension = "hm-bak"; # si un dotfile ya existe, lo respalda en vez de fallar
            home-manager.extraSpecialArgs = { inherit inputs; };

            # Tu usuario -> su configuración de home (la creamos abajo).
            home-manager.users.dariogg = import ./home/dariogg.nix;
          }
        ];
      };
    };
}
