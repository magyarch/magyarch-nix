{ pkgs , ... }:

{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [
     
     alacritty appimage-run acpi atool bat bc binutils brave conky curl dunst discord dmenu exa exfat exfatprogs feh ffmpeg_6-full fzf glib git htop heroic jamesdsp killall libnotify lm_sensors lutris lxappearance mangohud microsoft-edge mpd ncmpcpp maim mpv neofetch neovim ntfs3g ueberzug unrar unzip p7zip pamixer pavucontrol polybar protonup-ng pulseaudio pulsemixer qbittorrent rofi st s-tui spice spice-gtk spice-protocol sublime3 sxhkd sxiv system-config-printer virt-manager virt-viewer win-spice win-virtio wmctrl vifm xclip x264 xcape xdg-user-dirs xdo xdotool xorg.xdpyinfo xwallpaper zip 
    
    (slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus; }))
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
