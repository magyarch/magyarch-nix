{ config, lib, pkgs, ... }:


{

programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
                         clapper
                         mako
                         swaybg
			             swww
                         swappy
                         slurp
                         hyprland-protocols
                         #hyprlandPlugins.hy3
                         wayland-utils
                         #xwayland
                         wl-clipboard
                         wlroots
                         wlogout
                         wlsunset
                         wlprop
			             wofi
                         wf-recorder
                         waybar
                         wlrctl
                         wtype
                         dotool
                         xdg-desktop-portal-hyprland
                          xdg-desktop-portal-wlr
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
