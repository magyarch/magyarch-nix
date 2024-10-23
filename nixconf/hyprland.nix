{ config, pkgs, ... }:




    let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in {
  imports = [
    hyprland.nixosModules.default
  ];

  #nixpkgs.overlays = [ hyprland.overlays.default ];

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
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
                         wlrctl
                         wtype
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
