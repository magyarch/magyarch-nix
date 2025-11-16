{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.05";
  #programs.zsh.enable = true;
  home.packages = with pkgs; [
       brave
       dunst
       discord
       unstable.faugus-launcher
       filezilla
       unstable.floorp-bin
       geany
       jq
       unstable.lsfg-vk
       mangohud
       maim
       mpc
       mpv
       ncmpcpp
       rmpc
       rofi
       pavucontrol
       pulsemixer
       protonplus
       sublime3
       sxhkd
       stremio
       slstatus
       swww
       unstable.nsxiv
       unstable.heroic
       qutebrowser
       qbittorrent
       xwallpaper
       xwayland-satellite
       lxappearance
       picom-pijulius
       wmctrl
#       wlroots_0_19
  ];

}

