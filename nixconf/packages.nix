{ config, pkgs, ... }:


{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty
     appimage-run
     acpi 
     atool
#     amdvlk 
     bat 
     bc 
     binutils 
  #   brave 
     curl 
   #  cpu-x
     dunst
#     dxvk 
#     discord 
     dmenu 
     dzen2
     eza 
     exfat 
     exfatprogs 
     xfce.exo
     eww 
#     faac
     feh
     firefox
     graphviz
     gnome.file-roller
     ffmpeg_6-full 
     fzf 
     git
     htop 
     jamesdsp
     killall 
     libnotify 
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
     mprime
     neofetch 
     neovim 
     nix-du
     ntfs3g 
     ueberzug 
     unrar 
     unzip
     openrgb-with-all-plugins
     opera
     ocenaudio
    # picom-allusive
     p7zip 
     pamixer 
     pavucontrol
     picom 
     polybar 
     protonup-qt 
     pulseaudio 
     pulsemixer 
     qbittorrent 
     rofi 
     scrot
     slstatus
     sublime3
     sxhkd 
     sxiv 
     system-config-printer 
     stremio
     ventoy-full
    # virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
     wineWowPackages.full 
     wmctrl 
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
#     xorg.xinit 
     xwallpaper 
     yt-dlp 
     (discord.override {
       withOpenASAR = true;
       withVencord = true;
     })

     
     # (picom.overrideAttrs (oldAttrs: rec {
     #    pname = "compfy";
     #    version = "1.7.2";
     #    buildInputs = [
     #      pcre2
     #    ]
     #    ++
     #      oldAttrs.buildInputs;
     #    src = pkgs.fetchFromGitHub {
     #      owner = "allusive-dev";
     #      repo = "compfy";
     #      rev = version;
     #      hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
     #    };
     #    postInstall = '''';
     #  }))
    
#    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }

    
  ];
        pathsToLink = [ "/libexec" ];

	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	        XCURSOR_SIZE = "24";
    #           DISPLAY=":  0";
		        QT_SCALE_FACTOR = "1.6";
                QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          }; 

}
