{
  description = "disciples-of-jesus.org";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    packages = with pkgs; [
      zola
    ];
  in {
    packages.${system}.disciples-of-jesus = (
      let
        name = "disciples-of-jesus";
        version = "0.1.0";
      in pkgs.stdenv.mkDerivation {
          inherit name;
          src = ./.;
          buildInputs = packages;
          phases = [ "unpackPhase" "buildPhase" ];
          buildPhase = ''
            zola build
          '';
      }
    );
    devShells.${system}.default = pkgs.mkShell {
      inherit packages;
    };
    defaultPackage.${system} = self.packages.${system}.disciples-of-jesus;
  };
}
