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
     brave 
     curl 
     dunst 
     discord 
     dmenu 
     eza 
     exfat 
     exfatprogs 
     eww 
     feh 
     ffmpeg_6-full 
     firefox
     fzf 
     git 
     htop 
     jamesdsp 
     libnotify 
     lm_sensors 
     lutris 
     lxappearance 
     mangohud 
     microsoft-edge 
     mpd 
     ncmpcpp 
     maim 
     mpv 
     neofetch 
     neovim 
     ntfs3g 
     ueberzug 
     unrar 
     unzip 
     p7zip 
     pamixer 
     pavucontrol 
     picom-jonaburg 
     polybar 
     protonup-ng 
     pulseaudio 
     pulsemixer 
     qbittorrent 
     rofi 
     st 
     stress-ng
     spice 
     sublime3 
     sxhkd 
     sxiv 
     system-config-printer 
     virt-manager 
     #vscode-with-extensions
     #vscode-extensions.bbenoist.nix
     wineWowPackages.full 
     wmctrl 
     vifm 
     xclip 
     x264 
     xcape 
     xdg-user-dirs 
     xdo 
     xdotool 
     xorg.xdpyinfo 
     xwallpaper 
     yt-dlp 
    
#    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }))
     (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      ms-vscode-remote.remote-ssh
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];
  })
];

    #    ];
        
	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	        XCURSOR_SIZE = "24";
#		QT_SCALE_FACTOR = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          };

}
