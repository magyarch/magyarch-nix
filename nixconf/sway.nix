{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    i3status-rust
    clapper
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
    wayland-protocols
    wayland-utils
    wlroots
    wlogout
    wlsunset
    wlprop
    wofi
    wf-recorder
    wlrctl
    fuzzel
    wtype
    dotool
    swww
    xdg-desktop-portal-wlr
    jq
    copyq
    cliphist
  ];


  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
    extraSessionCommands = ''
  # SDL:
  export SDL_VIDEODRIVER=wayland
  # QT (needs qt5.qtwayland in systemPackages):
  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  # Fix for some Java AWT applications (e.g. Android Studio),
  # use this if they aren't displayed properly:
  export _JAVA_AWT_WM_NONREPARENTING=1
'';  
  };


}
