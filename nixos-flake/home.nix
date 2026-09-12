{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "26.05";
  
  home.packages = with pkgs; [
        unstable.goverlay
        unstable.protontricks
        unstable.vkbasalt
        unstable.vlc
       (pkgs.st.overrideAttrs (_: {
      src = ./local-packages/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ./local-packages/dmenu;
      patches = [ ];
    }))
    (pkgs.slstatus.overrideAttrs (_: {
       src = ./local-packages/slstatus;
      patches = [ ];
    }))  

  ];
  
}

