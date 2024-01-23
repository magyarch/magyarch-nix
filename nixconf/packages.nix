{ config, pkgs, ... }:


{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty
     appimage-run
     acpi 
     atool 
     bat 
     bc 
     binutils 
  #   brave 
     curl 
   #  cpu-x
     dunst 
     discord 
     dmenu 
     eza 
     exfat 
     exfatprogs 
     eww 
#     faac
     feh 
     floorp
     ffmpeg_6-full 
     fzf 
     git
     qsudo
     heroic
     htop 
     jamesdsp
     killall 
     libnotify 
     lm_sensors 
     lutris 
     lxappearance 
    # lxqt.lxqt-policykit
     mangohud
     mate.mate-polkit
     microsoft-edge 
     mpd 
     mprime
     ncmpcpp 
     maim 
     mpv 
     neofetch 
     neovim 
     ntfs3g 
     ueberzug 
     unrar 
     unzip 
    # picom-allusive
     p7zip 
     pamixer 
     pavucontrol 
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
     xwallpaper 
     yt-dlp 
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

	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	        XCURSOR_SIZE = "24";
    #              DISPLAY=":  0";
		QT_SCALE_FACTOR = "1.7";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          };

}
