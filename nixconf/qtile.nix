{ config, lib, pkgs, ... }:

{

  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.qtile.extraPackages = python3Packages: with python3Packages; [
                              keyring
                              #xcffib
                              #cairocffi-xcffib
                              setuptools
                              setuptools_scm
                              dateutil
                              dbus-python
                              grequests
                              mpd2
                              psutil
                              pyxdg
                              pygobject3
                             # xlib
                              (qtile-extras.overridePythonAttrs(old: { disabledTestPaths = [ "test/widget/test_strava.py" ]; }))
    ];

  services.xserver.displayManager.defaultSession = "none+qtile";


}
