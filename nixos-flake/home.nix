{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "26.05";
  programs.mpv = {
  enable = true;
  config = {
    hwdec = "vaapi";
    vo = "gpu";
    profile = "gpu-hq";
  };
};

  home.packages = with pkgs; [
        unstable.protontricks
        unstable.vkbasalt
        unstable.vlc
        librewolf
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
    (pkgs.dwm.overrideAttrs (_: {
       src = ./local-packages/dwm;
      patches = [ ];
    }))  


  ];
  
}

