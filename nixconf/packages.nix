{ pkgs , ... }:

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
     ffmpeg_6-full 
     firefox
     fzf 
     git 
   #  unstable.heroic
     htop 
     jamesdsp
     killall 
     libnotify 
     lm_sensors 
     lutris 
     lxappearance 
     mangohud 
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
    # picom-jonaburg
   #  picom-allusive 
     polybar 
     protonup-ng 
     pulseaudio 
     pulsemixer 
     qbittorrent 
     rofi 
    # spice 
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
     xdo 
     xdotool 
     xorg.xdpyinfo 
     xwallpaper 
     yt-dlp 
     (picom.overrideAttrs (oldAttrs: rec {
        pname = "picom-allusive";
        version = "1.4.3";
        src = pkgs.fetchFromGitHub {
          owner = "allusive-dev";
          repo = "picom-allusive";
          rev = version;
          hash = "sha256-nnm5xk1e8hot01zZwFmzUa/FeNCQdjlcO3xmRE56ydk=";
        };
      }))
    
#    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }))

    ];

     extraInit = ''
    xset s off -dpms
  '';
        
	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	        XCURSOR_SIZE = "24";
                  DISPLAY=":  0";
		QT_SCALE_FACTOR = "1.7";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          };

}
