{
  description = "My custom NixOS with Home Manager and Wayland stuff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    oxwm = {
        url = "github:tonybanters/oxwm";
    inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Xlibre
#    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    scenefx = {
      url = "github:wlrfx/scenefx";
      flake = false;
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mangowc, oxwm, ... }@inputs:
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
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit unstable inputs;
        };

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        # xlibre-overlay.nixosModules.overlay-xlibre-xserver
        # xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
         
         oxwm.nixosModules.default
         # Mangowc as window compositor
          mangowc.nixosModules.mango

          # Home Manager integration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit unstable; };
            home-manager.users.xeoncpu = import ./home.nix;
          }

          # Making unstable available inside NixOS modules
          { _module.args.unstable = unstable; }
        ];
      };
    };
}
