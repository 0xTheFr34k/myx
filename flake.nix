{
  description = "My personal NixOS/User configuration";

  inputs.devenv-root = {
    url = "file+file:///dev/null";
    flake = false;
  };
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  inputs.nur.url = "github:nix-community/NUR";
  inputs.devenv.url = "github:cachix/devenv";
  inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.disko = {
    url = "github:nix-community/disko";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.stylix = {
    url = "github:danth/stylix";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";

  # nixConfig = {
  # extra-trusted-public-keys =
  # "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
  # extra-substituters = "https://devenv.cachix.org";
  # };

  outputs = { self, devenv-root, ... }@inputs:
    let
      inherit (inputs)
        nixpkgs nixos-hardware flake-parts nur stylix home-manager;
      lib = nixpkgs.lib // home-manager.lib // {
        lo = (import ./lib { inherit lib nixpkgs; });
      };
    in flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devenv.flakeModule ];
      systems = lib.lo.systems;
      perSystem = { config, inputs', pkgs, system, ... }: {
        formatter = pkgs.treefmt;
        devenv.shells.default = {
          devenv.root =
            let devenvRootFileContent = builtins.readFile devenv-root.outPath;
            in pkgs.lib.mkIf (devenvRootFileContent != "")
            devenvRootFileContent;
          imports = [ ./devenv.nix ];
        };
      };
      flake = {
        nixosConfigurations = {
          pwnixos = lib.nixosSystem {
            specialArgs = { inherit inputs nixos-hardware; };
            system = "x86_64-linux";
            modules = [ ./hosts/freak ];
          };
        };

        homeConfigurations = {
          "freak@pwnixos" = lib.lo.mkHome {
            specialArgs = {
              inherit inputs;
              system = "x86_64-linux";
              host = "pwnixos";
            };
            modules = [ ./homes/freak ];
          };
          "kali@pwnixos" = lib.lo.mkHome {
            specialArgs = {
              inherit inputs;
              system = "x86_64-linux";
              host = "pwnixos";
            };
            modules = [ ./homes/kali ];
          };
        };
      };
    };
}
