{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  
   nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     alacritty
     appimage-run
     acpi
#     xorg.xhost 
     bat 
#     rofi
     bc
 #    brave
     binutils  
     curl
     corectrl
  #   dunst
#     dxvk 
     discord 
#     dmenu
#     dmenu-rs-enable-plugins 
#     dzen2
     distrobox
     eza 
     exfat 
     exfatprogs 
     glib
     xfce.exo
     eww 
   #  feh
     ffmpeg
     firefox-bin
     floorp
     protonplus
     filezilla
     fzf 
     git
     handbrake
    # hyprshade
     htop 
#     jamesdsp
     killall
     kitty
     libnotify
     libbsd
#     lf
     lm_sensors 
    # librewolf
     lutris
#     lxappearance
#     lxqt.lxqt-policykit
   #  lxqt.lxqt-openssh-askpass
#     kdePackages.polkit-kde-agent-1
     hyprpolkitagent
     #libbluray
     #libdvdcss
     mangohud
 #    mate.mate-polkit
     mesa
#     microsoft-edge
     mpd 
     ncmpcpp 
     maim 
     mpv 
     mprime
     fastfetch
     neovim 
     networkmanagerapplet
#     nix-du
     nix-search-cli
     ntfs3g 
     nwg-look
#     nwg-dock-hyprland
  #   ueberzug 
     unrar 
     unzip
#     obs-studio
#     obs-studio-plugins.wlrobs
    # onlyoffice-bin_latest
    # openrgb-with-all-plugins
     #paper-icon-theme
     #catppuccin-cursors.mochaDark 
     pamixer 
     pavucontrol 
  #   polybar
     pyprland 
     protonup
     qbittorrent 
    # rofi-wayland
   #  scrot
#     smplayer
#     spectrwm
     sublime3
     stress-ng
   #  sxhkd 
   #  sxiv 
     system-config-printer 
#     stalonetray
     stremio
#     syncthing
     ventoy-full
     #vlc
     #onlyoffice-desktopeditors
    # wine-staging
    # virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
    wineWowPackages.full 
     wineWowPackages.waylandFull
#     wmctrl
     vifm
     zellij 
#     unstable.hyprland
#      xorg.libxcb
#      xmonadctl
# #     xmobar
#      xsel
#      xorg.xinit
#      xorg.libX11 
#      xwallpaper
     yt-dlp 
     (heroic.override {
  extraPkgs = pkgs: [
    pkgs.gamescope
  ];
}) 


  #     (picom.overrideAttrs (oldAttrs: rec {
  #         pname = "compfy";
  #         version = "1.7.2";
  #         buildInputs = [
  #           pcre2
  #         ]
  #         ++
  #           oldAttrs.buildInputs;
  #         src = pkgs.fetchFromGitHub {
  #           owner = "allusive-dev";
  #           repo = "compfy";
  #           rev = version;
  #           hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
  #         };
  #         postInstall = '''';
  #       }))   
  #    # (dmenu.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/dmenu ; }))
  #    (catppuccin-sddm.override {
  #   flavor = "mocha";
  #   font  = "Noto Sans";
  #   fontSize = "9";
  #   background = "/home/xeoncpu/.local/bin/wallpapers/Future/mocha.png";
  #   loginBackground = true;
  # })         
     ];

        pathsToLink = [ "/libexec" ];
     
	
          }; 

       

}
