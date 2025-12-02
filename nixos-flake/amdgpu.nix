{ config, pkgs, ... }:

{

# Load AMD driver for Xorg and Wayland
 services.xserver.videoDrivers = ["modesetting"];
  hardware.cpu.amd.sev.enable = true;
#  powerManagement.cpuFreqGovernor = "performance"; # vagy "performance", "powersave"


  #Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        libva-utils
        vulkan-loader
    	libva-vdpau-driver
        libva
        rocmPackages.clr.icd
        rocmPackages.clr
	mesa
    ];
   
     extraPackages32 = with pkgs; [
        libva-vdpau-driver
        libva
       
      ];

  };

   environment.variables = {
                 AMD_VULKAN_ICD="RADV";
                 VDPAU_DRIVER = "radeonsi";
                 LIBVA_DRIVER_NAME = "radeonsi";
              };


 }
