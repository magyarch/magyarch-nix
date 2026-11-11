{ config, pkgs, unstable, ... }:

{
  programs.mango.enable = true;
    
  environment.systemPackages = with pkgs; [
#    foot
#    wmenu
    wl-clipboard
    wlogout
    grim
    slurp
    swappy
    swaybg
 #   firefox
    

  ];


  environment.localBinInPath = true;
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    joypixels
    source-code-pro
  ];


}
