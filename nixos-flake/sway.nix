{ config, pkgs, lib, unstable, ... }:


{
  programs.sway = {
    enable = true;
    package = unstable.sway;
    wrapperFeatures.gtk = true; # Needed for GTK apps to work.
    extraSessionCommands = ''
    export SDL_VIDEODRIVER = wayland
    export QT_QPA_PLATFORM = wayland
    export XDG_SESSION_TYPE = wayland 
    '';
  };  

#{
  environment.systemPackages = with pkgs; [
    #i3status-rust
    clapper
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
    wlogout
#    waybar
    wlsunset
#    wofi
    wf-recorder
    awww
    swaybg
#    xdg-desktop-portal-wlr
    jq
    copyq
    cliphist
    unstable.swayfx
  ];


  # enable sway window manager
  #programs.sway = {
   # enable = true;
    #wrapperFeatures.gtk = true;
  #};
#  programs.sway.package = pkgs.swayfx;

#  environment.etc."xdg/wayland-sessions/swayfx.desktop".text = ''
# [Desktop Entry]
# Name=SwayFX
# Comment=An i3-compatible Wayland compositor (SwayFX fork)
# Exec=sway
# Type=Application
# DesktopNames=SwayFX
#  '';
}
