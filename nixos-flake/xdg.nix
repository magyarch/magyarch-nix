{ config, pkgs, ...}:

{

 # Biztosítjuk, hogy az XDG portálok fussonak és tudják, mit kell megnyitni
xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  config = {
    common = {
      default = [ "gtk" ];
    };
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

