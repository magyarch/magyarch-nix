{ config, pkgs, unstable, ... }:

{
  
  home.username = "xeoncpu";
  home.homeDirectory = "/home/xeoncpu";
  home.stateVersion = "25.05";
  #programs.zsh.enable = true;
  home.packages = with pkgs; [
       brave
       maim
       stremio
  ];
}

