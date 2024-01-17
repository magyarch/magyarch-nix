 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager = {
                   bspwm.enable = true;
                   bspwm.configFile = "/home/xeoncpu/.config/bspwm/bspwmrc";
                   bspwm.sxhkd.configFile = "/home/xeoncpu/.config/sxhkd/sxhkdrc";
    
  };
}


 