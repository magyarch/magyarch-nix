{ config, pkgs, ... }:  

# let
#   pkgsUnstable = import <nixos-unstable> { config = config.nixpkgs.config; };
# in
 
 {
  programs.hyprland = {
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
#	                       unstable.hyprland
                         meson
			                   mako
			                   swww
                         #swappy
                         slurp
                         hyprland-protocols
                         hyprshot
                         hyprshade
			 hyprpaper
                         wayland-utils
                         #xwayland
                         wl-clipboard

                         wlroots
                         wlogout
                         wlsunset
                         #wlprop
                         #wlr-randr
			 wofi
                         wf-recorder
                         wl-screenrec
                         waybar
                         woomer
                         dotool
                         jq
                        grim
#                        tophat
                         #cliphist
	 		 ];

    # nixpkgs.overlays = [
    #   (self: super: {
    #     waybar = super.waybar.overrideAttrs (oldAttrs: {
    #       mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
    #     });

        
    #   })
    #  ];
    
  
}
