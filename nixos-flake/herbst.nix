 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.xserver.enable = true;
  services.xserver.windowManager.herbstluftwm.enable = true;
#  xsession.windowManager.herbstluftwm.enable = true;
 # services.xserver.windowManager.herbstluftwm.configFile = /home/xeoncpu/.config/herbstluftwm/autostart;
#  services.xserver.windowManager.herbstluftwm.package = /etc/nixos/pkgs.herbst.nix;

services.displayManager = {
         defaultSession = "none+herbstluftwm";
};
 
 xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["gtk"];
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal
      ];
    };

   
}
