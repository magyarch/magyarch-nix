{ pkgs, unstable, ... }:


{
  programs.sway = {
    enable = true;
    package = unstable.swayfx;
    wrapperFeatures.gtk = true; # Needed for GTK apps to work.
    extraSessionCommands = ''
  export SDL_VIDEODRIVER=wayland
  export QT_QPA_PLATFORM=wayland
  export XDG_SESSION_TYPE=wayland
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
    wlsunset
    wf-recorder
    awww
    swaybg
    jq
    copyq
    cliphist
  ];

}
