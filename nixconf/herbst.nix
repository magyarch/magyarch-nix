 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  #xservices.xserver.displayManager.defaultSession = "none+herbstluftwm";
  services.xserver.windowManager.herbstluftwm.enable = true;
#  xsession.windowManager.herbstluftwm.enable = true;
 # services.xserver.windowManager.herbstluftwm.configFile = /home/xeoncpu/.config/herbstluftwm/autostart;
#  services.xserver.windowManager.herbstluftwm.package = /etc/nixos/pkgs.herbst.nix;

services.xserver.displayManager = {
  session = [
    { manage = "desktop";
      name = "herbstluftwm";
      start = ''
        #${pkgs.herbstluftwm}/bin/herbstluftwm --locked &
        herbstluftwm --locked &
        waitPID=$!
      '';
    }
  ];
  defaultSession = "herbstluftwm";
};
                
   
}
