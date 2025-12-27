{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.11";
  #programs.zsh.enable = true;
  home.packages = with pkgs; [
       brave
       dunst
       unstable.faugus-launcher
       fancontrol-gui
       filezilla
       file-roller
       firefox
       fastfetch
       inxi
       geany
#       ghc
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
#       stremio
#       slstatus
       swww
       unstable.nsxiv
       unstable.heroic
#       vesktop
       discord
 #      qutebrowser
       qbittorrent
       xwallpaper
       xwayland-satellite
       lxappearance
       picom-pijulius
       wmctrl
       unstable.cliphist
       wlr-randr

#       wpsoffice
       (pkgs.st.overrideAttrs (_: {
      src = ./local-packages/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ./local-packages/dmenu;
      patches = [ ];
    }))
    (pkgs.slstatus.overrideAttrs (_: {
      src = ./local-packages/slstatus;
      patches = [ ];
    }))
#      surf
      xorg.libxcb
      xdotool
      xorg.xdpyinfo
      xorg.xwininfo
      xorg.libX11
      xorg.libXft
      xorg.libXinerama
      harfbuzz
      gnumake
      gcc
      binutils
      pkg-config

  ];
  
}

