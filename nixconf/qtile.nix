{ config, lib, pkgs, ... }:

{

  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.qtile.backend = "x11";
  services.xserver.windowManager.qtile.extraPackages = python3Packages: with python3Packages; [
                             # keyring
                              #xcffib
                              #cairocffi-xcffib
                              setuptools
                              setuptools_scm
                              dateutil
                              dbus-python
                              grequests
                              psutil
                             # pyxdg
                             # pywlroots
                             # pygobject3
                             # xlib
                              (qtile-extras.overridePythonAttrs(old: { disabledTestPaths = [ "test/widget/test_strava.py" ]; }))
    ];


  services.xserver.displayManager.defaultSession = "none+qtile";

  environment.variables = {
                 GDK_SCALE = "2";
                 GDK_DPI_SCALE = "0.5";
       #          XCURSOR_SIZE = "24";
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
