 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  
  services.xserver = {
       enable = true;
       xkb.layout = "hu";
	   xkb.variant = "";  
};

  services.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm = {
                  enable = true;
#		  package = pkgs.dwm.overrideAttrs {
#		  src = ./local-packages/dwm;
 #        src = ./config/suckless/dwm;
#		  };
		};


}
