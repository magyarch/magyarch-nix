{ config, pkgs, unstable, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.qtile = {
    enable = true;
    # Python csomagok, amiket a qtile config.py-od importál
    extraPackages = python3Packages: with python3Packages; [
      qtile-extras   # extra widgetek, dekorációk
      psutil         # rendszerinfó widgetekhez
    ];

  };
}
