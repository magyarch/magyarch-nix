{ pkgs , ... }:

{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty appimage-run acpi atool bat bc binutils brave curl dunst discord dmenu exa exfat exfatprogs eww feh ffmpeg_6-full findutils fzf glib git heroic htop jamesdsp killall legendary-gl libnotify lm_sensors lutris lxappearance mangohud mlocate microsoft-edge mpd ncmpcpp maim mpv neofetch neovim ntfs3g ueberzug unrar unzip p7zip pamixer pavucontrol picom-jonaburg polybar protonup-ng pulseaudio pulsemixer qbittorrent rofi st spice sublime3 sxhkd sxiv system-config-printer virt-manager wineWowPackages.full wmctrl vifm xclip x264 xcape xdg-user-dirs xdo xdotool xorg.xdpyinfo xwallpaper yt-dlp zip 
    
#    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }))
        ];
        
	variables = {
                GDK_SCALE = "2";
                GDK_DPI_SCALE = "0.5";
	 	XCURSOR_SIZE = "24";
#		QT_SCALE_FACTOR = "1";
               #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
             };
          };

}
