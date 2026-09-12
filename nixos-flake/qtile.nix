{ config, lib, pkgs, ... }:

{

  services.xserver.windowManager.qtile = {
  enable = true;
    
    package = pkgs.python3Packages.qtile;
  };
}
