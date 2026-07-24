{
  description = "Dev shell del proyecto (Scala/Java)";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      jdk = pkgs.jdk17;   # <- JDK de ESTE proyecto (jdk8/jdk11/jdk17/jdk21)
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          jdk
          pkgs.sbt
          pkgs.scala-cli
          pkgs.metals
          pkgs.scalafmt
        ];

        # sbt/Metals usan este JDK concreto.
        JAVA_HOME = "${jdk.home}";

        shellHook = ''
          echo "→ Entorno del proyecto (JDK ${jdk.version}, sbt)"
        '';
      };
    };
}
