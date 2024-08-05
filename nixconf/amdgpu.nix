{ config, pkgs, ... }:

{

# Load AMD driver for Xorg and Wayland
  services.xserver.videoDrivers = ["modesetting"];
  hardware.cpu.amd.sev.enable = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
    libdrm
    vaapiVdpau
    vdpauinfo
    libvdpau
    libvdpau-va-gl
    rocmPackages.clr.icd
];
   extraPackages32 = with pkgs; [
  driversi686Linux.amdvlk
];
  };

   environment.variables = {
                #   GDK_SCALE = "2";
                #   GDK_DPI_SCALE = "0.5";
               #XCURSOR_SIZE = "24";
 # #    # #           DISPLAY=":  0";
           #       QT_SCALE_FACTOR = "1.55";
 #    #             QT_AUTO_SCREEN_SCALE_FACTOR = "auto";
#                  QT_QPA_PLATFORM = "wayland";
 #                #WLR_NO_HARDWARE_CURSOR = "1";
 #                #NIXOS_OZONE_WL = "1";
                  ROC_ENABLE_PRE_VEGA = "1";
                 #AMD_VULKAN_ICD="RADV";
                VDPAU_DRIVER = "radeonsi";
                  LIBVA_DRIVER_NAME = "radeonsi";
              };

 }
