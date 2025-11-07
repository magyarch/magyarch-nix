{ config, pkgs, ... }:

{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
#    foot
#    wmenu
    wl-clipboard
    grim
    slurp
    swappy
    swaybg
    wofi
    wlogout
    waybar
 #   firefox
  ];
  
  environment.localBinInPath = true;
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    joypixels
    source-code-pro
  ];
}
