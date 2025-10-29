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
#      rofi
      wmctrl
      dunst
      ripgrep
#      syncthing
      exfat
      exfatprogs
      xfce.exo
      xclip
      st
      xwayland-satellite
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
      discord
      eww
      feh
      ffmpeg-full
      filezilla
      firefox-esr
      git
      geany
      #handbrake
      #jamesdsp
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
      mangohud
      mate.mate-polkit
      mesa
# Browsers
      microsoft-edge
      #brave
# -------------------------------
      mpc
      ncmpcpp
#      maim
      mpv
      neovim
      networkmanagerapplet
      nix-search-cli
      nwg-look
      ueberzug
      unrar
      unzip
      pulsemixer
      pavucontrol
      polybar
      pyprland
 #     protonplus
      picom-pijulius
      qbittorrent
      rmpc
      sublime3
      #spectrwm
      sxhkd
      unstable.nsxiv
      system-config-printer
      # stalonetray
#      stremio
      slstatus
      ventoy-full
      # onlyoffice-desktopeditors
      wineWowPackages.full
      wineWowPackages.waylandFull
      vifm
      vulkan-tools
      vulkan-loader
      yt-dlp
      ytarchive
      unstable.heroic
      xwallpaper
      xorg.libxcb
      xdotool
      xorg.xdpyinfo
      xorg.xwininfo
      xorg.libX11
      xorg.libXft
      xorg.libXinerama
      qutebrowser
      harfbuzz
      gnumake
      gcc
      glib
      binutils
      pkg-config
      rofi
    ];

   };
}
