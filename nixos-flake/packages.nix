{ config, pkgs, lib, ... }:

# let
#   unstableTarball = fetchTarball {
#     url    = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
#     sha256 = "F8WmEwFoHsnix7rt290R0rFXNJiMbClMZyIC/e+HYf0=";
#   };
# in {
#   nixpkgs.config = {
#     packageOverrides = pkgs: {
#       unstable = import unstableTarball {
#         config = config.nixpkgs.config;
#       };
#     };
#   };

{
  # List packages installed in system profile
  environment = {
    systemPackages = with pkgs; [
# Terminals      
      alacritty
      kitty
# -------------------------      
# Utilities      
      acpi
      bat
      curl
      corectrl
      eza
      htop
      lm_sensors
      localsend
      util-linux
      fastfetch
      ntfs3g
      rofi
      unstable.wmctrl
      dmenu
      dunst
      fzf
      exfat
      exfatprogs
      xfce.exo
      st
      mako
      fuzzel
      xwayland-satellite
     # autotiling
# --------------------------       
# X11/xorg pkg
     #   xorg.libxcb
     # #  xmonadctl
        xdotool
     #  xorg.xmodmap
     # # sbcl
     #  xorg.xdpyinfo
     #  xorg.xwininfo
     #  xorg.libX11
     #  xorg.libXft
     #  xorg.libXinerama
     #  harfbuzz
     #  gnumake
     #  pkg-config
      killall
      bc
      binutils
     # rlwrap
     # ratpoison.contrib
      # dzen2
      discord
      glib
      gcc
      eww
      feh
      ffmpeg
      filezilla
      unstable.firefox-esr
      git
      geany
      handbrake
      jamesdsp
      imagemagick
      libnotify
      libbsd
      libva
      libva-utils
      libvdpau-va-gl
      vaapiVdpau
      lutris
#      i3blocks
      lxappearance
      # lxqt.lxqt-policykit
      # lxqt.lxqt-openssh-askpass
      mangohud
      mate.mate-polkit
      mesa
# Browsers      
      microsoft-edge
      brave
# -------------------------------      
      mpc
      ncmpcpp
      maim
      mpv
      neovim
      networkmanagerapplet
      nix-search-cli
      #nwg-look
      ueberzug
      unrar
      unzip
      pamixer
      pavucontrol
      polybar
 #     pyprland
      protonplus
      picom-pijulius
      qbittorrent
      rmpc
      sublime3
      #spectrwm
      sxhkd
      sxiv
      system-config-printer
      # stalonetray
      stremio
      slstatus
      ventoy-full
      # onlyoffice-desktopeditors
      wineWowPackages.full
      #wineWowPackages.waylandFull
      # wmctrl
      #wmenu
      vifm
      vulkan-tools
      vulkan-loader
      #xmonadctl
      yt-dlp
      ytarchive
      unstable.heroic
      xwallpaper
  #     (pkgs.st.overrideAttrs (_ : {
  #        src = /home/xeoncpu/.config/suckless/st;
	 # patches = [ ];
	 # }))
    ];

   };
}
