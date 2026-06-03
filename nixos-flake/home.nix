{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.11";
  
  home.packages = with pkgs; [
        unstable.goverlay
        unstable.protontricks
        vkbasalt
        arandr
           vlc
           wlr-randr
        unstable.cider-2   
#       wpsoffice
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

