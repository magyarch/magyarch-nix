{ config, pkgs, ... }:


{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty
#     amdgpu_top
     appimage-run
     acpi 
     atool
     apg
#     amdvlk 
     bat 
     bc 
     binutils 
  #   brave 
     curl
     chromium 
   #  cpu-x
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
     #glib
     graphviz
     gnome.file-roller
     #gnome.nixos-gsettings-overrides
     #gsettings-desktop-schemas
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
     libbsd
     lm_sensors 
     lutris 
     lxappearance 
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
     ueberzug 
     unrar 
     unzip
     openrgb-with-all-plugins
#     opera
#     ocenaudio
    # picom-allusive
     p7zip 
     pamixer 
     pavucontrol
#     picom 
     polybar 
     protonup-qt 
     pulseaudio 
     pulsemixer 
     qbittorrent 
     rofi 
     scrot
     slstatus
    # spectrwm
     sublime3
     st
     sxhkd 
     sxiv 
     system-config-printer 
     stremio
#     ventoy-full
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
    
#    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }
    ];

        pathsToLink = [ "/libexec" ];

	# variables = {
 #                 GDK_SCALE = "2";
 #                 GDK_DPI_SCALE = "0.5";
	#  	         XCURSOR_SIZE = "24";
 #    # #           DISPLAY=":  0";
	# 	         QT_SCALE_FACTOR = "1.5";
 #    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
 #                #WLR_NO_HARDWARE_CURSOR = "1";
 #                #NIXOS_OZONE_WL = "1";
 #               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
	#   #      VDPAU_DRIVER = "radeonsi";
 #       #         LIBVA_DRIVER_NAME = "radeonsi";
 #             };
          }; 

}
