{ config, pkgs, ... }:

{


programs.sway = {
    enable = true;
    #xwayland.enable = true;
    #enableNvidiaPatches = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      swaylock
      swayidle
      swaybg
      wl-clipboard
      mako 
      grim
      slurp
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  programs.waybar.enable = true;

  # QT
   qt.platformTheme = "qt5ct";

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
#  services.gnome.gnome-keyring.enable = true;
#  services.xserver.displayManager.sddm.enable = true;

}
