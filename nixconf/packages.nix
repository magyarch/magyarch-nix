{ config, pkgs, ... }:

let
   unstable = import <unstable> { };
in  

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
     bemenu
     bc 
     binutils  
     curl
     catppuccin-sddm
   davinci-resolve-studio
     dunst
#     dxvk 
#     discord 
     dmenu 
#     dzen2
     eza 
     exfat 
     exfatprogs 
     xfce.exo
     eww 
#     faac
     feh
     unstable.firefox
     ffmpeg
     fzf 
     git
     handbrake
     htop 
     jamesdsp
     killall
     kitty
#     linuxKernel.packages.linux_xanmod.amdgpu-pro
     libnotify
#     libbsd
#     lf
     lm_sensors 
     lutris 
     lxappearance
#     iconTheme.package
     mangohud
     mate.mate-polkit
     mesa
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
     unstable.pyprland 
     protonup
     pulseaudio 
     pulsemixer 
     qbittorrent 
 #    qogir-icon-theme
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
     vieb
    # virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
     wineWowPackages.full 
     wineWowPackages.waylandFull
     wmctrl
     walker
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
#     (opera.override { proprietaryCodecs = true; })
     (discord.override {
       withOpenASAR = true;
       withVencord = true;
     })

     (catppuccin-sddm.override {
    flavor = "mocha";
    font  = "Noto Sans";
    fontSize = "9";
    background = "${./mocha.png}";
    loginBackground = true;
  })

     (picom.overrideAttrs (oldAttrs: rec {
         pname = "compfy";
         version = "1.7.2";
         buildInputs = [
           pcre2
         ]
         ++
           oldAttrs.buildInputs;
         src = pkgs.fetchFromGitHub {
           owner = "allusive-dev";
           repo = "compfy";
           rev = version;
           hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
         };
         postInstall = '''';
       }))   
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
     
	 variables = {
                #   GDK_SCALE = "2";
                #   GDK_DPI_SCALE = "0.5";
	  	         #XCURSOR_SIZE = "24";
 # #    # #           DISPLAY=":  0";
  	       #       QT_SCALE_FACTOR = "1.55";
 #    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
#                  QT_QPA_PLATFORM = "wayland";
 #                #WLR_NO_HARDWARE_CURSOR = "1";
 #                #NIXOS_OZONE_WL = "1";
                  ROC_ENABLE_PRE_VEGA = "1";
                  AMD_VULKAN_ICD="RADV";
	              VDPAU_DRIVER = "radeonsi";
                  LIBVA_DRIVER_NAME = "radeonsi";
              };
          }; 

}
