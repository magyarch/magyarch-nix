{ config, pkgs, unstable, ... }:

{

services.jellyfin = {
  enable = true;
  openFirewall = true;
  user="jellyfin";
 };

  environment.systemPackages =  with pkgs; [
    unstable.jellyfin
    unstable.jellyfin-web
    unstable.jellyfin-ffmpeg
  ];
}

