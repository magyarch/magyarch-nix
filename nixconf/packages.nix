{ pkgs , ... }:

{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     alacritty
     mpv
     ueberzug
     exa
     dmenu
     htop
     vifm
     git
     discord
     unzip
     unrar
     xclip
     neovim
     neofetch
     maim
    killall
    mpd
    ncmpcpp
    exfat
    exfatprogs
    feh
    xwallpaper
    sxiv
    fzf
    sxhkd
    ffmpeg_6-full
    x264
    xorg.xdpyinfo
    lxappearance
    pavucontrol
    pulseaudio
    pamixer
  #  polybar
    pulsemixer
    bc
    lm_sensors
    jamesdsp
    bat
    curl
    binutils
    s-tui
    ntfs3g
#    openrgb
    atool
    zip
    p7zip
    acpi
    xcape
    xdo
    xdotool
    wmctrl
    glib
    dunst
    rofi
    qbittorrent
    heroic
    brave
    microsoft-edge
    xdg-user-dirs
    libnotify
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    system-config-printer
    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }))
        ];
        
	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	XCURSOR_SIZE = "24";
#		QT_SCALE_FACTOR = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          };

}
