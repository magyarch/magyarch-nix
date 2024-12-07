{ config, pkgs, ... }:

  {

  #nixpkgs.overlays = [ hyprland.overlays.default ];

  # nix.settings = {
  #   substituters = ["https://hyprland.cachix.org"];
  #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  # };

  programs.hyprland = {
    enable = true;
           
  };


#env var
  environment.variables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  #   xdg = {
  #   # For some reason, the nix module for Hyprland broke screensharing (with XDPH missing)
  #   # Enablng the portal fixes it.
  #   portal = {
  #     enable = true; 
  #     config.common.default = "*";
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-gtk
  #    #   xdg-desktop-portal-hyprland
  #     ];
  #   };
  # };
  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
	                     meson
			                 grim
                         clapper
                         mako
                         swaybg
			                   swww
                         swappy
                         slurp
                         hyprland-protocols
                         hyprshot
                         pyprland  
                         #hyprlandPlugins.hy3
                         wayland-utils
                         #xwayland
                         wl-clipboard

                         wlroots
                         wlogout
                         wlsunset
                         wlprop
                         wlr-randr
			                   wofi
                         wf-recorder
                         waybar
                         dotool
                         jq
                         copyq
                         cliphist
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
