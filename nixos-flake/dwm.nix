 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  
  services.xserver.enable = true;
  services.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm = {
                  enable = true;
		  package = pkgs.dwm.overrideAttrs {
		  src = ./local-packages/dwm;
 #        src = ./config/suckless/dwm;
		  };
		};

 # Suckless Tools
  # nixpkgs.overlays = [
   #  (final: prev: {
 #  #    dwm = prev.dwm.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dwm ;});
    #  dmenu = prev.dmenu.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/dmenu ;});
    #  st = prev.st.overrideAttrs (_: { src = ./local-packages/st ;});
    #   slstatus = prev.slstatus.overrideAttrs (_: { src = ./local-packages/slstatus; });
   # })
  # ];
    
 xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["gtk"];
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal
      ];
    };



}
