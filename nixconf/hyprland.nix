{ config, pkgs, ... }:


{

programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
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
                         wayland-protocols
                         wayland-utils
                         #xwayland
                         wl-clipboard
                         wlroots
                         wlogout
                         wlsunset
			                   wofi
			                   qt5ct
                         qt6ct
                         waybar
                         xdg-desktop-portal-hyprland
	 		 ];

    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
        });
      })
     ];
    
  
}
