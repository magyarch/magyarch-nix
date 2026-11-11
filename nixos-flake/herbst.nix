# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
services.xserver = {
    enable = true;
	xkb.layout = "hu";
	xkb.variant = "";
	dpi = 125;
};

services.xserver.windowManager.herbstluftwm = {
  enable = true;
  package = pkgs.herbstluftwm.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
    dontUsePytestCheck = true;
  });
};

services.displayManager = {
         defaultSession = "none+herbstluftwm";
  };
 
}
