{ config, pkgs, ... }:


{

programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };

#env var
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };


# List packages installed in system profile
    environment.systemPackages = with pkgs; [
	                 meson
			 grim
       mako
			 hyprpaper
                         wayland-protocols
                         wayland-utils
                         wl-clipboard
                         wlroots
			 wofi
			 waybar
              #           xdg-desktop-portal-hyprland
	 		 ];

    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
        });
      })
     ];
    
  
}
