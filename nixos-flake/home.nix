{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.05";
  #programs.zsh.enable = true;
  home.packages = with pkgs; [
       brave
       dunst
       unstable.faugus-launcher
       filezilla
       firefox
       fastfetch
       inxi
       geany
       jq
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
       vesktop
       qutebrowser
       qbittorrent
       xwallpaper
       xwayland-satellite
       lxappearance
       picom-pijulius
       wmctrl
       unstable.cliphist
       wlr-randr
  ];

}

