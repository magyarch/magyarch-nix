 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, ... }:

{
  services.xserver.enable = true;  
  services.displayManager.defaultSession = "none+spectrwm";
  services.xserver.windowManager.spectrwm.enable = true;               
  services.xserver.windowManager.session = [{
    name = "spectrwm";
    start = ''
      ${pkgs.spectrwm}/bin/spectrwm &
      waitPID=$!
    '';
  }];

}
