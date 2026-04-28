{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.11";
  #programs.zsh.enable = true;
  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
    };
  };

  home.packages = with pkgs; [
#       brave
        protontricks
        vkbasalt
#       wpsoffice
#       (pkgs.st.overrideAttrs (_: {
#      src = ./local-packages/st;
#      patches = [ ];
#    }))
#    (pkgs.dmenu.overrideAttrs (_: {
#      src = ./local-packages/dmenu;
#      patches = [ ];
#    }))
#    (pkgs.slstatus.overrideAttrs (_: {
#       src = ./local-packages/slstatus;
#      patches = [ ];
#    }))  

  ];
  
}

