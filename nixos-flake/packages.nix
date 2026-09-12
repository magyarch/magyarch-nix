 {config, pkgs, unstable, ... }:

{

environment = {
    systemPackages = with pkgs; [
    # --- Terminals ---
    alacritty
    kitty
    st

    # --- Internet & Browsers ---
    brave
    filezilla
    microsoft-edge
    firefox
    unstable.signal-desktop

    # --- Audio, Video & Multimedia ---
    calibre
    eog
    foliate
    ffmpeg-full
    ffmpegthumbnailer
    file-roller
    handbrake
    kodi
    mpc
    mpv
    ncmpcpp
    pavucontrol
    pulsemixer
    qimgv
    rmpc
    unstable.nsxiv
    mkvtoolnix
    yt-dlp
    ytarchive
    ytmdl

    # --- Gaming & Wine ---
    rpcs3
    mangohud
    protonplus
    unstable.heroic
    unstable.xenia-canary
    vulkan-tools
    wineWow64Packages.full
 #   wineWow64Packages.waylandFull

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
    rocmPackages.clr.icd
    unstable.cliphist
    unstable.mesa
    usbimager
    util-linux
    ventoy-full
    xdg-user-dirs

    # --- File Systems ---
    exfat
    exfatprogs
    ntfs3g

    # --- Compression Utilities ---
    arj
    bzip2
    cpio
    gnutar
    gzip
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

    # --- Editors & IDEs ---
    geany
    neovim
    ueberzug

    # --- Themes & Look ---
    arc-theme
    ayu-theme-gtk
    lxappearance
    
    # --- X11, Window Managers & Desktop Components ---
    harfbuzz
    imagemagick
    killall
    libX11
    libXft
    libXinerama
    libxcb
    libxcb-wm
    picom
    polybar
    rofi
    slstatus
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
    gcc
    git

    # =========================================================================
    # DEACTIVATED / COMMENTED PACKAGES
    # =========================================================================
    # dmenu
    # gnome-disk-utility
    # isoimagewriter
     usbutils
    # ghc
    # nwg-displays
    # nwg-drawer
    # xwayland-satellite
     autotiling
    # xmonadctl
    # xmodmap
    # rlwrap
    # ratpoison.contrib
    # dzen2
     eww
    # feh
    # jamesdsp
    # vaapiVdpau
    # i3blocks
#     nwg-look
    # system-config-printer
    # onlyoffice-desktopeditors
    # scrot
    # sublime3
    # stremio
    # awww
 #    vesktop
     discord
    # qutebrowser
 #    wlr-randr
    # zig
    # gnumake
    # pkg-config
    # xrdb
    # winboat
 #    inputs.helium.packages.${system}.default
    ];
 
  };

}   

