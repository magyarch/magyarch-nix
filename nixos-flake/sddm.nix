# SDDM is a display manager for X11 and Wayland
{
  pkgs,
  config,
  lib,
  ...
}: 
 {  
  services.displayManager.sddm = { 
      enable = true;
      wayland.enable = true;
    };
  

#  environment.systemPackages = [sddm-astronaut];
}

