{ config, lib, pkgs, ... }:

{

  services.xserver.windowManager.qtile.enable = true;
  services.xserver.windowManager.qtile.configFile = /home/xeoncpu/.config/qtile/config.py;
  services.xserver.windowManager.qtile.backend = "wayland";
  services.xserver.windowManager.qtile.extraPackages = python3Packages: with python3Packages; [
                              keyring
                              #xcffib
                              #cairocffi-xcffib
                              setuptools
                              setuptools_scm
                              dateutil
                              dbus-python
                              grequests
                              psutil
                              pyxdg
                              pywlroots
                              pygobject3
                              qtile-extras
                             # xlib
          #                    (qtile-extras.overridePythonAttrs(old: { disabledTestPaths = [ "test/widget/test_strava.py" ]; }))
    ];

    nixpkgs.overlays = [
  (self: super: {
    qtile-unwrapped = super.qtile-unwrapped.overrideAttrs(_: rec {
      postInstall = let
        qtileSession = ''
        [Desktop Entry]
        Name=Qtile Wayland
        Comment=Qtile on Wayland
        Exec=qtile start -b wayland
        Type=Application
        '';
        in
        ''
      mkdir -p $out/share/wayland-sessions
      echo "${qtileSession}" > $out/share/wayland-sessions/qtile.desktop
      '';
      passthru.providedSessions = [ "qtile" ];
    });
  })
];

services.displayManager.sessionPackages = [ pkgs.qtile-unwrapped ];
#env var
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

}
