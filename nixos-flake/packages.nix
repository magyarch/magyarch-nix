 {config, pkgs, unstable, ... }:


{
  # List packages installed in system profile
  environment = {
    systemPackages = with pkgs; [
# Terminals
      alacritty
      kitty
# -------------------------
# Utilities
      ayu-theme-gtk
      arc-theme
#      kvantum
      acpi
      bat
      bc
      unstable.mesa
      curl
      curlftpfs
      corectrl
      fd
#      dmenu
#      gnome-disk-utility
#      isoimagewriter
#      unstable.dino
      lftp
#      ghc
      eza
      eog
      nwg-displays
      nwg-drawer
      ytmdl
      btop
      lm_sensors
      util-linux
#      fastfetch
      unstable.goverlay
      fzf
      ntfs3g
      ripgrep
#      syncthing
      exfat
      exfatprogs
      xfce.exo
      xclip
 #     st
      unstable.signal-desktop
      mkvtoolnix
#      xwayland-satellite
      autotiling
# --------------------------
# X11/xorg pkg
#        xorg.libxcb
#       xmonadctl
#        xdotool
     #  xorg.xmodmap
      killall
      binutils
     # rlwrap
     # ratpoison.contrib
      # dzen2
 #     eww
    #  feh
      ffmpeg-full
      ffmpegthumbnailer
      git
      #jamesdsp
      imagemagick
      libnotify
#      vaapiVdpau
      vkbasalt
      protontricks
#      i3blocks
      mate.mate-polkit
# -------------------------------
      neovim
      networkmanagerapplet
      nix-search-cli
      nwg-look
 #     microsoft-edge
      firefox
      ueberzug
      arj
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
      zstd
      polybar
#      system-config-printer
      ventoy-full
      # onlyoffice-desktopeditors
      wineWowPackages.full
      wineWowPackages.waylandFull
      wmctrl
      vifm
       faugus-launcher
       usbimager
       qimgv
       filezilla
       file-roller
       firefox-esr
       fastfetch
       inxi
       handbrake
       geany
       jq
       mangohud
#       maim
#       scrot
       mpc
       mpv
       ncmpcpp
       rmpc
       rofi
       pavucontrol
       pulsemixer
       protonplus
       protontricks
#       sublime3
#       sxhkd
#       stremio
#       slstatus
       swww
       unstable.nsxiv
       unstable.heroic
#       vesktop
#       discord
 #      qutebrowser
       qbittorrent
       xwallpaper
#       xwayland-satellite
       lxappearance
       picom-pijulius
       wmctrl
       unstable.cliphist
#       wlr-randr
#      wmenu
      vulkan-tools
#      vulkan-loader
      yt-dlp
      ytarchive
      libxcb
      xdotool
      xorg.xdpyinfo
      xorg.xwininfo
      xorg.libX11
      xorg.libXft
#      xorg.xinit
#      xorg.xrandr
      xorg.libXinerama
#      zig
#      harfbuzz
#      gnumake
#      gcc
  #    binutils
      pkg-config
      xdg-user-dirs
 #      xorg.xrdb
#        winboat
#        inputs.zen-browser.packages."${system}".default

    ];
#      inputs.zen-browser.packages."${system}".default


   };
}
