{ config, pkgs, unstable, ... }:

{
  programs.mango.enable = true;
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

  environment.systemPackages = with pkgs; [
#    foot
#    wmenu
    wl-clipboard
    grim
    slurp
    swappy
    swaybg
    wofi
    wlogout
    waybar
 #   firefox
    

  ];
  
  environment.localBinInPath = true;
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    joypixels
    source-code-pro
  ];
}
