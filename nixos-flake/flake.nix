{
  description = "My custom NixOS with Home Manager and Wayland stuff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
#    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # Xlibre
    #xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    xlibre-overlay = {
      url = "git+https://codeberg.org/takagemacoed/xlibre-overlay?ref=dev-for-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
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
         inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
         inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-evdev
           inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
           inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-video-amdgpu

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
