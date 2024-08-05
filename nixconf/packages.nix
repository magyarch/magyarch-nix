{ config, pkgs, ... }:

{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     amdgpu_top
     appimage-run
     acpi
     apg
     atool 
     bat 
     brave
     bc 
     binutils  
     curl
     dunst
#     dxvk 
#     discord 
     dmenu 
#     dzen2
     eza 
     exfat 
     exfatprogs 
     glib
     xfce.exo
     eww 
#     faac
     feh
#     unstable.firefox
     ffmpeg
     fzf 
     git
     handbrake
     htop 
     jamesdsp
     killall
     kitty
     libnotify
     librewolf
#     libbsd
#     lf
     lm_sensors 
     lutris 
     lxappearance
     lxqt.lxqt-policykit
     lxqt.lxqt-openssh-askpass
     #libbluray
     #libdvdcss
     mangohud
     makemkv
#     mate.mate-polkit
     mesa
     mission-center
     microsoft-edge 
     mpd 
     ncmpcpp 
     maim 
     mpv 
     fastfetch
     neovim 
#     nix-du
     ntfs3g 
     nwg-look
     ueberzug 
     unrar 
     unzip
     openrgb-with-all-plugins
     p7zip 
     pamixer 
     pavucontrol 
     polybar
     pyprland 
     protonup
     qbittorrent 
     rofi
     scrot
     smplayer
    # spectrwm
     sublime3
#     st
     sxhkd 
     sxiv 
     system-config-printer 
#     stalonetray
     stremio
     ventoy-full
    # virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
     wineWowPackages.full 
     wineWowPackages.waylandFull
     wmctrl
     vifm
     zellij 
     xorg.xev
     xclip 
     x264 
     xcape 
     xdg-user-dirs
     xdg-utils 
     xdo 
     xdotool 
     xorg.xdpyinfo
     xorg.xsetroot
     xmonadctl
     xmobar
     xsel
     xorg.xinit 
     xwallpaper 
     yt-dlp 
    (opera.override { proprietaryCodecs = true; })
     (discord.override {
       withOpenASAR = true;
       withVencord = true;
     })


     # (picom.overrideAttrs (oldAttrs: rec {
     #     pname = "compfy";
     #     version = "1.7.2";
     #     buildInputs = [
     #       pcre2
     #     ]
     #     ++
     #       oldAttrs.buildInputs;
     #     src = pkgs.fetchFromGitHub {
     #       owner = "allusive-dev";
     #       repo = "compfy";
     #       rev = version;
     #       hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
     #     };
     #     postInstall = '''';
     #   }))   
     # (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus ; }))
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
