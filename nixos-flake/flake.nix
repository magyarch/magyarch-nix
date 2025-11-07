
{
  description = "My custom NixOS with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  #  inputs.hyprland.follows = "hyprland";
#      };
    flake-parts.url = "github:hercules-ci/flake-parts";
    scenefx = {
      url = "github:wlrfx/scenefx";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, flake-parts, mangowc, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs unstable; };
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
           mangowc.nixosModules.mango
          # home-manager integráció
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            
            home-manager.extraSpecialArgs = {
              inherit unstable;
            };

            home-manager.users.xeoncpu = import ./home.nix;
          }

          
          { _module.args.unstable = unstable; }
        ];
      };
    };
}
