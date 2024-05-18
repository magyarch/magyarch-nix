{ config, lib, pkgs, ... }:
# let
 
#   flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
#   hyprland = (import flake-compat {
#     src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
#   }).defaultNix;
# in {
#   imports = [
#     hyprland.nixosModules.default
#   ];



{

programs.hyprland = {
    enable = true;
    xwayland.enable = true;
   # enableNvidiaPatches = true;
  };

#env var
  environment.variables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
	                       meson
			                   grim
                         mako
                         swaybg
			                   swww
                         swappy
                         slurp
                         hyprland-protocols
                         wayland-utils
                         #xwayland
                         wl-clipboard
                         wlroots
                         wlogout
                         wlsunset
                         wlprop
			                   wofi
                         waybar
                         xdg-desktop-portal-hyprland
	 		 ];

    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
        });
      
 #       hyprland = super.hyprland.overrideAttrs (old: { src = /home/xeoncpu/.config/hypr/.src/hyprland ;});
      })
     ];
    
  
}
