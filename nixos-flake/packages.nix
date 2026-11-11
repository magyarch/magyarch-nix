 {config, pkgs, unstable, ... }:

{

environment = {
    systemPackages = with pkgs; [
    # --- Terminals ---
    alacritty
    kitty
    st
 #   xauth

    # --- Internet & Browsers ---
#    brave
    filezilla
    microsoft-edge
    firefox
    unstable.signal-desktop

    # --- Audio, Video & Multimedia ---
    avidemux
    calibre
    foliate
    ffmpeg-full
    ffmpegthumbnailer
    file-roller
    handbrake
    kodi
    jamesdsp
    mpc
    mpv
    ncmpcpp
    pavucontrol
    pulsemixer
    rmpc
    unstable.nsxiv
    mkvtoolnix
    yt-dlp
#    ytarchive
#    ytmdl

    # --- Gaming & Wine ---
    lsfg-vk
    rpcs3
    mangohud
 #   protonplus
    protonup-ng
    unstable.heroic
 #   unstable.mesa
    vulkan-tools
    wineWow64Packages.full
    wineWow64Packages.waylandFull

    # --- System Utilities & CLI Tools ---
    acpi
    arandr
    bat
    bc
    binutils
    btop
    corectrl
    curl
    curlftpfs
    eza
    fastfetch
    fd
    fzf
    inxi
    jq
    lftp
    libnotify
    libmtp
    jmtpfs
    lm_sensors
    maim
    mate-polkit
    networkmanagerapplet
    nix-search-cli
    ripgrep
    usbimager
    ventoy-full
    xdg-user-dirs

    # --- File Systems ---
    exfatprogs
    ntfs3g

    # --- Compression Utilities ---
    libarchive
    lz4
    p7zip
    pigz
    pixz
    unrar
    unzip

    # --- Editors & IDEs ---
    geany
    neovim
    ueberzug

    # --- Themes & Look ---
 #   arc-theme
 #   ayu-theme-gtk
    lxappearance
    
    # --- X11, Window Managers & Desktop Components ---
    imagemagick
    picom
    polybar
    rofi
   # slstatus
    sxhkd
    vifm
    wmctrl
    xclip
    xdotool
    xdpyinfo
    xfce4-exo
    xinit
    xrandr
    xwallpaper
    xwininfo
    unstable.faugus-launcher

    # --- Development & Build Tools ---
    git

    # =========================================================================
    # DEACTIVATED / COMMENTED PACKAGES
    # =========================================================================
    # dmenu
    # gnome-disk-utility
    # isoimagewriter
     usbutils
    # ghc
     nwg-displays
    # nwg-drawer
    # xwayland-satellite
     autotiling
    # xmonadctl
    # xmodmap
    # rlwrap
    # ratpoison.contrib
    # dzen2
    # eww
     feh
    # jamesdsp
    # vaapiVdpau
    # i3blocks
     nwg-look
    # system-config-printer
    # onlyoffice-desktopeditors
     scrot
    # sublime3
    # stremio
    # awww
 #    vesktop
 #    discord
     qbittorrent
     wlr-randr
    # zig
    # gnumake
    # pkg-config
    # xrdb
    # winboat
 #    inputs.helium.packages.${system}.default
    ];
 
  };

}   

