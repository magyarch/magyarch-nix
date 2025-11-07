{ config, pkgs, unstable, ... }:


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
      bc
      curl
      curlftpfs
      lftp
      eza
      htop
      lm_sensors
      util-linux
      fastfetch
      fzf
      ntfs3g
      ripgrep
#      syncthing
      exfat
      exfatprogs
      xfce.exo
      xclip
     # st
#      xwayland-satellite
     # autotiling
# --------------------------
# X11/xorg pkg
     #   xorg.libxcb
       xmonadctl
#        xdotool
     #  xorg.xmodmap
      killall
      binutils
     # rlwrap
     # ratpoison.contrib
      # dzen2
      eww
    #  feh
      ffmpeg-full
      git
      #handbrake
      #jamesdsp
      imagemagick
      libnotify
      libbsd
      libva
      libva-utils
      libvdpau-va-gl
      vaapiVdpau
#      i3blocks
      mate.mate-polkit
      mesa
# -------------------------------
      neovim
      networkmanagerapplet
      nix-search-cli
      nwg-look
      ueberzugpp
      unrar
      unzip
  #    polybar
      pyprland
      imagemagick
      system-config-printer
      # stalonetray
#      stremio
#      slstatus
      ventoy-full
      # onlyoffice-desktopeditors
      wineWowPackages.full
      wineWowPackages.waylandFull
      vifm
      vulkan-tools
      vulkan-loader
      yt-dlp
      ytarchive
 #     xorg.libxcb
 #     xdotool
 #     xorg.xdpyinfo
 #     xorg.xwininfo
 #     xorg.libX11
 #     xorg.libXft
 #     xorg.libXinerama
       xorg.xrdb
    ];

   };
}
