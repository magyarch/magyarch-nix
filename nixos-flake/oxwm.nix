{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
#    windowManager.oxwm.enable = true;
  };

   services.xserver.windowManager.oxwm = {
    enable = true;
    # Use a specific version or build with custom options
#    package = oxwm.packages.${pkgs.system}.default;
  };
  # Or use another display manager like sddm, gdm, etc.
   xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["gtk"];
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal
      ];
    };

}
