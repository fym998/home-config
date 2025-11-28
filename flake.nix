{
  description = "Home Manager configuration of fym";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "fym";
      homeDirectory = "/home/${username}";
    in
    rec {
      inherit pkgs self inputs;

      mkLib = import ./lib;

      localLib = mkLib rec {
        inherit pkgs;

        inherit (pkgs) lib;

        hmLib = import "${inputs.home-manager}/modules/lib" { inherit lib; };

        sourceRoot = {
          source = "${homeDirectory}/.config/home-manager";
          inStore = ./.;
        };
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit self inputs localLib;
        };

        modules = [
          ./config
          ./modules

          {
            home = {
              inherit username homeDirectory;
              stateVersion = "25.05"; # Do not change!
            };

            programs.home-manager = {
              enable = true;
            };
          }
        ];
      };
    };
}
