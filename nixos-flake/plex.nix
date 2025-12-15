{ config, pkgs, unstable, ... }:

{

services.jellyfin = {
  enable = true;
  openFirewall = true;
  user="jellyfin";
 };

  environment.systemPackages =  with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    #unstable.jellyfin-media-player
  ];
}

