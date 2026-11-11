{ config, pkgs, unstable, ... }:

{

# Load AMD driver for Xorg and Wayland
 services.xserver = {
      videoDrivers = ["modesetting"];
      extraConfig = ''
    Section "Device"
      Identifier  "GPU"
      Driver      "amdgpu"
      Option      "TearFree"  "true"
    EndSection
  '';
};


  #Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        unstable.libva
        unstable.vulkan-loader
#        unstable.vulkan-validation-layers
        rocmPackages.clr.icd
#        rocm-opencl-icd
      ];
      extraPackages32 = with pkgs; [
        unstable.libva
       
      ];
    };
   
    environment.systemPackages = with pkgs; [ lact ];
    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = ["multi-user.target"];
 
 }
