{ config, pkgs, unstable, ... }:

{

# Load AMD driver for Xorg and Wayland
 services.xserver.videoDrivers = ["amdgpu"];
  hardware.cpu.amd.sev.enable = true;
#  powerManagement.cpuFreqGovernor = "performance"; # vagy "performance", "powersave"


  #Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        unstable.libva-vdpau-driver
        #libvdpau-va-gl
        unstable.libva
        unstable.vulkan-loader
        unstable.vulkan-validation-layers
      ];
      extraPackages32 = with pkgs; [
        unstable.libva-vdpau-driver
        #libvdpau-va-gl
        unstable.libva
       
      ];
    };


   environment.variables = {
                 AMD_VULKAN_ICD="RADV";
                 VDPAU_DRIVER = "radeonsi";
                 LIBVA_DRIVER_NAME = "radeonsi";
              };


 }
