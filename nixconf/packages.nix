{ config, pkgs, ... }:

let
  unstable = import <unstable> { };
in  

{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty
     amdgpu_top
     appimage-run
     acpi
#     adw-gtk3
     atool
     apg
#     amdvlk 
     bat 
     bc 
     binutils 
#     unstable.bumblebee-status
  #   brave 
     curl
#     chromium 
   #  cpu-x
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
     firefox
#     glib
 #    graphviz
#     qt6Packages.qtstyleplugin-kvantum
 #    libsForQt5.qtstyleplugin-kvantum
 #    nwg-look
     ffmpeg
     fzf 
     git
     handbrake
#     haskellPackages.xmonad_0_18_0
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
#     mprime
     neofetch 
     neovim 
#     nix-du
     ntfs3g 
     nwg-look
     ueberzug 
     unrar 
     unzip
     openrgb-with-all-plugins
#     unstable.spotube
#     opera
#     ocenaudio
    # picom-allusive
     p7zip 
     pamixer 
     pavucontrol
#     papirus-icon-theme
#     picom 
     unstable.polybar 
     protonup-qt 
     pulseaudio 
     pulsemixer 
     unstable.qbittorrent 
 #    qogir-icon-theme
     rofi
     scrot
#     slstatus
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
     wmctrl
#     xwayland
     vifm 
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
#     xorg.xinit 
     xwallpaper 
     yt-dlp 
#     (opera.override { proprietaryCodecs = true; })
     (discord.override {
       withOpenASAR = true;
       withVencord = true;
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

    ];

        pathsToLink = [ "/libexec" ];
     
	 variables = {
                 #  GDK_SCALE = "2";
                   #GDK_DPI_SCALE = "0.5";
	  	         #XCURSOR_SIZE = "24";
 # #    # #           DISPLAY=":  0";
  	#         QT_SCALE_FACTOR = "1.5";
 #    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
 #                #WLR_NO_HARDWARE_CURSOR = "1";
 #                #NIXOS_OZONE_WL = "1";
                  ROC_ENABLE_PRE_VEGA = "1";
                  AMD_VULKAN_ICD="RADV";
	              #VDPAU_DRIVER = "radeonsi";
                  #LIBVA_DRIVER_NAME = "radeonsi";
              };
          }; 

}
