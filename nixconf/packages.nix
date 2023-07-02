{ pkgs , ... }:
{
    # List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     alacritty
     mpv
     ueberzug
     exa
     htop
     vifm
     git
     discord
     dmenu
     unzip
     unrar
     xclip
     neovim
     neofetch
     maim
    killall
    i3blocks
   # unclutter
    mpd
    ncmpcpp
    feh
    xwallpaper
    sxiv
    fzf
    sxhkd
    ffmpeg
    lxappearance
    pavucontrol
    pulseaudio
    pamixer
    pulsemixer
    playerctl
    cpu-x
    bc
    lm_sensors
    bat
    curl
    binutils
    s-tui
    ntfs3g
    atool
    zip
    p7zip
    acpi
    xcape
    xdo
    xdotool
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
        ];
        variables = { EDITOR = "vim";
	              GDK_SCALE = "2";
		      GDK_DPI_SCALE = "0.5";
    };

};

}
