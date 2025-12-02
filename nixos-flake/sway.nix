{ config, pkgs, lib, unstable, ... }:


{
  programs.sway = {
    enable = true;
    # Használd az unstable csomagból a sway-t
    package = unstable.sway;
    # opcionálisan extra konfigurációk...
  };

#{
  environment.systemPackages = with pkgs; [
    #i3status-rust
    clapper
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
    wayland-protocols
    wayland-utils
    wlroots
    wlogout
    waybar
    wlsunset
    wofi
    wf-recorder
    fuzzel
    wtype
    dotool
    swww
    xdg-desktop-portal-wlr
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
