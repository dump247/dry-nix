{
  description = "Dry is a terminal application to manage Docker and Docker Swarm.";

  outputs = { self, nixpkgs }: let
    name = "dry";
    url = version: file: "https://github.com/moncho/dry/releases/download/v${version}/${file}";
    release = import ./release.nix;
  in {
    packages = nixpkgs.lib.mapAttrs (system: value:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        default = with pkgs; stdenv.mkDerivation {
          inherit name;
          inherit (release) version;

          src = fetchurl {
            url = url release.version value.file;
            inherit (value) sha256;
          };

          buildCommand = ''
            mkdir -p $out/bin
            cp $src $out/bin/${name}
            chmod +x $out/bin/${name}
            '';
        };
      }
    ) release.systems;
  };
}
