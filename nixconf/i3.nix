# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
#  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      autotiling
      i3blocks
    ];
  };

  environment.variables = {
                 GDK_SCALE = "2";
                 GDK_DPI_SCALE = "0.5";
                 XCURSOR_SIZE = "24";
    # #           DISPLAY=":  0";
                 QT_SCALE_FACTOR = "1.5";
    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
                #WLR_NO_HARDWARE_CURSOR = "1";
                #NIXOS_OZONE_WL = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    #            VDPAU_DRIVER = "radeonsi";
       #         LIBVA_DRIVER_NAME = "radeonsi";
             };
}
