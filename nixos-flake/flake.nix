{
  description = "My custom NixOS with Home Manager and Wayland stuff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    oxwm = {
      url = "github:tonybanters/oxwm";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    scenefx = {
      url = "github:wlrfx/scenefx";
      flake = false;
    };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mangowm, noctalia, dgop, ... }@inputs:
    let
      system = "x86_64-linux";
      
      # Az unstable csomagok importálása
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        
        # Az inputs és az unstable átadása minden modulnak
        specialArgs = { inherit inputs unstable; };
        
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          
          mangowm.nixosModules.mango
          home-manager.nixosModules.home-manager

          {
            nixpkgs.config.allowUnfree = true;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            # Unstable átadása a Home Manager-nek is
            home-manager.extraSpecialArgs = { inherit inputs unstable; };
            home-manager.users.xeoncpu = import ./home.nix;
          }
        ];
      };
    };
}
