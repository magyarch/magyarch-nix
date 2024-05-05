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
 #     dmenu = prev.dmenu.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dmenu ;});
#      st = prev.st.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/st ;});
      slstatus = prev.slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; });
   })
  ];

   environment.variables = {
                 #GDK_SCALE = "2";
                 #GDK_DPI_SCALE = "0.5";
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
