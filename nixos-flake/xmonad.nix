{ config, pkgs, ...}:

{
#  services.displayManager.defaultSession = "none+xmonad";
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPackages: [
      haskellPackages.dbus
      haskellPackages.List
      haskellPackages.monad-logger
      ];
  };

  services.xserver.windowManager.xmonad.config = builtins.readFile /home/xeoncpu/.config/xmonad/xmonad.hs;

  environment.systemPackages = with pkgs; [
                   #haskellPackages.xmonad_0_18_0

               
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*"; # opcionális
  };

  environment.variables = {
#                 GDK_SCALE = "1.33";
 #                GDK_DPI_SCALE = "0.5";
                 XCURSOR_SIZE = "24";
    # #           DISPLAY=":  0";
  #               QT_SCALE_FACTOR = "1.33";
    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
                #WLR_NO_HARDWARE_CURSOR = "1";
                #NIXOS_OZONE_WL = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
#                VDPAU_DRIVER = "radeonsi";
#                LIBVA_DRIVER_NAME = "radeonsi";
             };
}
