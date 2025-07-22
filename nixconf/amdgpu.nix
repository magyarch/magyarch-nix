{ config, pkgs, ... }:

{

# Load AMD driver for Xorg and Wayland
# services.xserver.videoDrivers = ["modesetting"];
  hardware.cpu.amd.sev.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil"; # vagy "performance", "powersave"


  #Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        libva-utils
        libvdpau-va-gl
        vaapiVdpau
        rocmPackages.clr
    ];
   
  };

   environment.variables = {
                 AMD_VULKAN_ICD="RADV";
                 VDPAU_DRIVER = "radeonsi";
                 LIBVA_DRIVER_NAME = "radeonsi";
              };

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];          

 }
