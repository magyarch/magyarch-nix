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
       filezilla
       firefox-esr
       geany
       lutris
       mangohud
       maim
       mpc
       microsoft-edge
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
       unstable.nsxiv
       unstable.heroic
       qutebrowser
       qbittorrent
       xwallpaper
       xwayland-satellite
       lxappearance
       picom-pijulius
       wmctrl
  ];
}

