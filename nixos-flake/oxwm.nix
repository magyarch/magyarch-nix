{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
#    windowManager.oxwm.enable = true;
  };

   services.xserver.windowManager.oxwm = {
    enable = true;
    # Use a specific version or build with custom options
#    package = oxwm.packages.${pkgs.system}.default;
  };
  
}
