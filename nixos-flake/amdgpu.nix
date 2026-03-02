{ config, pkgs, unstable, ... }:

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
        unstable.libva-vdpau-driver
        unstable.libvdpau-va-gl
        unstable.libva
        unstable.vulkan-loader
        unstable.vulkan-validation-layers
        rocmPackages.clr.icd
      ];
      extraPackages32 = with pkgs; [
        unstable.libva-vdpau-driver
        unstable.libvdpau-va-gl
        unstable.libva
       
      ];
    };
   environment.systemPackages = with pkgs; [
    lact
  ];

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

 }
