{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (fetchTarball "https://github.com/oxcl/nix-flake-helium-browser/archive/main.tar.gz")).overlays.default
  ];

  environment.systemPackages = [ pkgs.helium ];
}
