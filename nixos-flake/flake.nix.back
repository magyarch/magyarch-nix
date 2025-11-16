{
  description = "My custom NixOS with Home Manager and Wayland stuff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    scenefx = {
      url = "github:wlrfx/scenefx?rev=7f9e7409f6169fa637f1265895c121a8f8b70272";
      flake = false;
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc?rev=df46194b5f720eaa9650e16d316a2bb340d424f8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mangowc, ... }@inputs:
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
