 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.xserver.displayManager.defaultSession = "none+herbstluftwm";
  services.xserver.windowManager.herbstluftwm.enable = true;
#  xsession.windowManager.herbstluftwm.enable = true;
#  services.xserver.windowManager.herbstluftwm.configFile = /home/xeoncpu/.config/herbstluftwm/autostart;
#  services.xserver.windowManager.herbstluftwm.package = pkgs.herbstluftwm.overrideAttrs ( o: {
 #   disabledTests = o.disabledTests ++ ["test_complete_keybind_offers_additional_mods_without_duplication"];
 # });
                
   
}
