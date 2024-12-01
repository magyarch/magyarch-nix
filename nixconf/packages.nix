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
#     acpi
#     atool 
     bat 
#     bc 
#     brave
     binutils
     celluloid  
     curl
     dunst
#     dxvk 
#     discord 
#     dmenu-rs
#     dmenu-rs-enable-plugins 
#     dzen2
     eza 
     exfat 
     exfatprogs 
     glib
     gtkmm4
     xfce.exo
     eww 
#     faac
#     feh
     floorp
     ffmpeg
     fzf 
     git
     handbrake
     htop 
     jamesdsp
     killall
     kitty
     libnotify
     libbsd
#     lf
     lm_sensors 
     lutris 
   #  lxappearance
     lxqt.lxqt-policykit
     lxqt.lxqt-openssh-askpass
     #libbluray
     #libdvdcss
     mangohud
 #    mate.mate-polkit
     mesa
     microsoft-edge 
     mpd 
     ncmpcpp 
    # maim 
     mpv 
     fastfetch
     neovim 
#     nix-du
     ntfs3g 
     nwg-look
#     nwg-dock-hyprland
  #   ueberzug 
     unrar 
     unzip
#     obs-studio
#     obs-studio-plugins.wlrobs
     onlyoffice-bin_latest
     openrgb-with-all-plugins
     paper-icon-theme
     catppuccin-cursors.mochaDark 
     pamixer 
     pavucontrol 
  #   polybar
     pyprland 
     protonup
     qbittorrent 
   #  rofi
  #   scrot
#     smplayer
#     spectrwm
     sublime3
     st
 #    sxhkd 
  #   sxiv 
     system-config-printer 
#     stalonetray
     stremio
     ventoy-full
     vlc
    # virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
     wineWowPackages.full 
     wineWowPackages.waylandFull
#     wmctrl
     vifm
     zellij 
#     xorg.xev
#      xclip 
#    #  x264 
#      xcape 
#      xdg-user-dirs
 #     xdg-utils 
#      xdo 
#      xdotool 
#      xorg.xdpyinfo
#      xorg.xsetroot
#      xorg.libxcb
#      xmonadctl
# #     xmobar
#      xsel
#      xorg.xinit
#      xorg.libX11 
#      xwallpaper 
     yt-dlp 
#    (vivaldi.override {
 #   proprietaryCodecs = true;
  #  enableWidevine = true;
  #})
     (unstable.discord.override {
       withOpenASAR = true;
       withVencord = true;
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
