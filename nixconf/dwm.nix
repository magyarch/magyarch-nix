 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.xserver.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm.enable = true;
 
 # Suckless Tools
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dwm ;});
#      dmenu = prev.dmenu.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dmenu ;});
#      st = prev.st.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/st ;});
      slstatus = prev.slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; });
   })
  ];
  


}
