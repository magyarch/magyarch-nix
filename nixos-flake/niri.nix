{ config, pkgs, lib, ... }:

let
  pkgsUnstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in
 
 {
  programs.niri = {
    enable = true;
    # set the flake package
 #   package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
  #  portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };


#env var
  environment.variables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
                wayland-protocols
		wlroots
		wlogout
		waybar
#		meson
		];

    

  }   
