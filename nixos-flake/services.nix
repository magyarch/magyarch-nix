{ config, lib, pkgs, ... }:

{
    # List services that you want to enable:
    services.xserver = {
#        enable = true;
	xkb.layout = "hu";
	xkb.variant = "";
	dpi = 144;
};
    

       services.displayManager.ly = {
       enable = true;
    #  wayland.enable = true;   
     };
   
#   services.greetd = {
#    enable = true;
#    settings = {
#      default_session = {
#        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd stumpwm";
#      user = "greeter";
#      };
#    };
#  };



#   xdg.portal.enable = true;
 #  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "*";

    services = {
           printing.enable = true;
           printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	   avahi.enable = true;
	   avahi.nssmdns4 = true;
	   avahi.openFirewall = true;
          flatpak.enable = true;
#	   lsfg-vk.enable = true;
     dbus.enable = true;
	   fstrim = {
	   enable = true;
	   interval = "weekly";
	   };
#	   unclutter-xfixes.enable = true;
	   openssh.enable = true;       
	   gvfs.enable = true;
	   tumbler.enable = true;
     pipewire = {
           enable = true;
#	   alsa.enable = true;
           alsa.support32Bit = true;
           pulse.enable = true;
       };

#    cpupower-gui.enable = true;

    mpd = {
    enable = true;
    user = "xeoncpu";
    musicDirectory = "/mnt/Zenék";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
    startWhenNeeded =
      true; # systemd feature: only start MPD service upon connection to its socket
  };
};
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR =
      "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };

   powerManagement.cpuFreqGovernor = "performance"; # vagy "performance", "powersave"
  # Példa NixOS konfigurációban:


      # System76 Scheduler 
          #        services.system76-scheduler = {
           #                       enable = true;
            #                      settings.processScheduler.foregroundBoost.foreground.nice = -5;
             #                     settings.processScheduler.foregroundBoost.foreground.ioPrio = 0;
              #                    useStockConfig = false;
               #                 };

      # #= IRQBalance
       services.irqbalance.enable = true;

   virtualisation.podman = {
  enable = true;
  dockerCompat = true;
 };

      
}
