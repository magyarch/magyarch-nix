{
  description = "My custom NixOS with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
#    xlibre-overlay = {
#      url = "git+https://codeberg.org/takagemacoed/xlibre-overlay?ref=dev-for-26.05";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
     mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     blip = {
      url = "github:blip-net/nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
   };

    scenefx = {
      url = "github:wlrfx/scenefx";
      flake = false;
    };

     noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     
     umbriel = {
      url = "github:noctalia-dev/umbriel/cachix";
     };

#    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, noctalia, umbriel, ... }@inputs:
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
 #        inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
 #        inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-evdev
 #          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
 #          inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-video-amdgpu
 #           mango.nixosModules.mango
#            umbriel.nixosModules.default
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
