{ config, pkgs, unstable, ... }:

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
    mako
 #   firefox
    

  ];


  environment.localBinInPath = true;
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    joypixels
    source-code-pro
  ];

  environment.sessionVariables = {
#  XCURSOR_SIZE = "24";
  QT_QPA_PLATFORM = "wayland";
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
#  QT_AUTO_SCREEN_SCALE_FACTOR = "1";

 # ELECTRON_OZONE_PLATFORM_HINT = "auto";
  ELECTRON_DISABLE_GPU_INSTANCE = "1";
  LIBVA_DRIVER_NAME = "radeonsi";

  RADV_PERFTEST = "aco";

  WLR_RENDERER = "vulkan";
  WLR_RENDERER_ALLOW_SOFTWARE = "0";

  MOZ_ENABLE_WAYLAND = "1";
};


}
