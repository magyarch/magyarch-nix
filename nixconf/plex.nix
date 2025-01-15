{ config, pkgs, ... }:

{

services.plex = {
  enable = true;
  openFirewall = true;
  #user="xeoncpu";
 };
}

