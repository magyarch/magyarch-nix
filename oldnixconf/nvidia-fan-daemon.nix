{ config, lib, pkgs, ... }:

let
  user = config.nvidiaFan.user;

  nvidiaSettings = config.boot.kernelPackages.nvidiaPackages.nvidiaSettings;

  script = pkgs.writeShellScript "nvidia-fan-control" ''
    #!/usr/bin/env bash

    export DISPLAY=:0
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=Hyprland
    export XAUTHORITY="/home/${user}/.Xauthority"

    ${pkgs.xorg.xhost}/bin/xhost +SI:localuser:${user}
    ${nvidiaSettings}/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1"

    while true; do
      TEMP=$(${nvidiaSettings}/bin/nvidia-settings -q [gpu:0]/GPUCoreTemp -t)

      if [ "$TEMP" -lt 40 ]; then SPEED=20
      elif [ "$TEMP" -lt 50 ]; then SPEED=35
      elif [ "$TEMP" -lt 60 ]; then SPEED=50
      elif [ "$TEMP" -lt 70 ]; then SPEED=65
      elif [ "$TEMP" -lt 80 ]; then SPEED=80
      else SPEED=100
      fi

      ${nvidiaSettings}/bin/nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$SPEED"
      sleep 10
    done
  '';
in {
  options.nvidiaFan = {
    enable = lib.mkEnableOption "Enable dynamic NVIDIA fan control daemon";
    user = lib.mkOption {
      type = lib.types.str;
      description = "Username of graphical session (Wayland)";
    };
  };

  config = lib.mkIf config.nvidiaFan.enable {
    systemd.user.services.nvidia-fan-daemon = {
      description = "NVIDIA Fan Control Daemon (User)";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        ExecStart = "${script}";
        Restart = "always";
      };
    };

    environment.systemPackages = [ script ];
  };
}



