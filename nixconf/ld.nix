{ config, pkgs, ... }:


{

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
       dmenu
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

}
