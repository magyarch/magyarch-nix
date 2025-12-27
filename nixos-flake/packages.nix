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
      unstable.mesa
      curl
      curlftpfs
      fd
      lftp
#      ghc
      eza
      htop
      lm_sensors
      util-linux
#      fastfetch
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
      autotiling
# --------------------------
# X11/xorg pkg
     #   xorg.libxcb
       xmonadctl
       xorg.xauth
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
#      vaapiVdpau
      vkbasalt
#      i3blocks
      mate.mate-polkit
      mesa
# -------------------------------
      neovim
      networkmanagerapplet
      nix-search-cli
      nwg-look
      ueberzugpp
      arj
      brotli
      bzip2
      cpio
      gnutar
      gzip
      lha
      libarchive
      lrzip
      lz4
      lzop
      p7zip
      pbzip2
      pigz
      pixz
      unrar
      unzip
      xz
      zip
      zstd
      polybar
      pyprland
      unstable.pciutils
      unstable.usbutils
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
      wmenu
      vulkan-tools
#      vulkan-loader
      yt-dlp
      ytarchive
 #     xorg.libxcb
 #     xdotool
 #     xorg.xdpyinfo
 #     xorg.xwininfo
      xorg.libX11
 #     xorg.libXft
      xorg.xrandr
      xdg-user-dirs
       xorg.xrdb
    ];

   };
}
