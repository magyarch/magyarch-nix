{ config, lib, pkgs, ... }:

{
    # List services that you want to enable:
    services.xserver = {
#        enable = true;
	xkb.layout = "hu";
	xkb.variant = "";
	dpi = 120;
#	screenSection = ''Option "TearFree" "true"'';
       # windowManager.bspwm.configFile = "/home/xeoncpu/.config/bspwm/bspwmrc";
      # windowManager.bspwm.sxhkd.configFile = "/home/xeoncpu/.config/sxhkd/sxhkdrc";
# 	desktopManager = {
# 	            xfce = {
#     enable = true;
#     noDesktop = true;
#     enableXfwm = false;
#   };
# };  
#	windowManager.herbstluftwm.package = pkgs.herbstluftwm.overrideAttrs ( o: {
#    disabledTests = o.disabledTests ++ ["test_complete_keybind_offers_additional_mods_without_duplication"];
#  });


};
    

      services.displayManager.ly = {
      enable = true;
#      wayland.enable = true;   
    };
                      
                
    services = {
       
           printing.enable = true;
           printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	   avahi.enable = true;
	   avahi.nssmdns4 = true;
	   avahi.openFirewall = true;
 #         flatpak.enable = true;
#	   picom.enable = true;
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
	   #alsa.enable = true;
           alsa.support32Bit = true;
           pulse.enable = true;
	   }; 


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

  
      # System76 Scheduler 
                 services.system76-scheduler = {
                                 enable = true;
                                 settings.processScheduler.foregroundBoost.foreground.nice = 6;
                                 useStockConfig = true;
                               };

      #= IRQBalance
    #  services.irqbalance.enable = true;

 #   virtualisation.podman = {
 #  enable = true;
 #  dockerCompat = true;
 # };

      
}
