{ config, pkgs, ...}:

{

 # Biztosítjuk, hogy az XDG portálok fussonak és tudják, mit kell megnyitni
xdg.portal = {
  enable = true;
  wlr.enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  config.sway = {  
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
    };
  };


# Megmondjuk a rendszernek, hogy a Firefox a default az URL-ekhez
xdg.mime = {
  enable = true;
  defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };
};
}

