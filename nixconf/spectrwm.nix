 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.xserver.displayManager.defaultSession = "none+spectrwm";
  services.xserver.windowManager.spectrwm.enable = true;               
   
   nixpkgs.overlays = [
   (final: prev: {
     spectrwm = prev.spectrwm.overrideAttrs (old: { src = /home/xeoncpu/.config/spectrwm/.src/spectrwm ;});
    })
  ];

}