{ config, pkgs, ... }:

{

# Load AMD driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amdgpu"];
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

 }
