 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
   
  services.displayManager.defaultSession = "none+bspwm";
  services.xserver.windowManager = {
                   bspwm.enable = true;
                   bspwm.configFile = "/home/xeoncpu/.config/bspwm/bspwmrc";
                   bspwm.sxhkd.configFile = "/home/xeoncpu/.config/sxhkd/sxhkdrc";
    
  };

  environment.variables = {
    #             GDK_SCALE = "2";
     #            GDK_DPI_SCALE = "0.5";
      #           XCURSOR_SIZE = "24";
    # #           DISPLAY=":  0";
                 QT_SCALE_FACTOR = "1.5";
    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
                #WLR_NO_HARDWARE_CURSOR = "1";
                #NIXOS_OZONE_WL = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    #            VDPAU_DRIVER = "radeonsi";
       #         LIBVA_DRIVER_NAME = "radeonsi";
             };

nixpkgs.overlays = [
   (final: prev: {
     #spectrwm = prev.spectrwm.overrideAttrs (old: { src = /home/xeoncpu/.config/spectrwm/.src/spectrwm ;});
     dmenu = prev.dmenu.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dmenu ;});
     st = prev.st.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/st ;});
    })
  ];

}


 
