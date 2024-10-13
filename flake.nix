{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    seal = {
      url = "github:Henkru/seal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      nixos-generators,
      seal,
      ...
    }:
    rec {
      mkStronghold =
        system:
        {
          extraModules ? [ ],
          format ? "iso",
          brotherSerialId,
        }:
        let
          pkgsForSystem =
            system:
            import nixpkgs {
              inherit system;
              overlays = [
                (final: prev: { seal = seal.packages.${system}.seal; })
              ] ++ (import ./overlays { });
            };
        in
        nixos-generators.nixosGenerate {
          inherit system format;
          specialArgs = {
            pkgs = pkgsForSystem system;
            inherit brotherSerialId;
            inherit system;
          };
          modules = [
            # Pin nixpkgs to the flake input, so that the packages installed
            # come from the flake inputs.nixpkgs.url.
            (
              { ... }:
              {
                nix.registry.nixpkgs.flake = nixpkgs;
              }
            )
            # Apply the rest of the config.
            ./configuration.nix
          ] ++ extraModules;
        };

      # default ISO images
      packages =
        let
          allVMs = [
            "x86_64-linux"
            "aarch64-linux"
          ];
        in
        nixpkgs.lib.genAttrs allVMs (system: {
          stronghold = mkStronghold system { brotherSerialId = "XXXXXXXXXXXX"; };
        });
    };
}
