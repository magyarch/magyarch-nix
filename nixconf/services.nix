{ config, pkgs, ... }:

{
    # List services that you want to enable:
    services.xserver = {
        enable = true;
	xkb.layout = "hu";
	xkb.variant = "";
	dpi = 144;
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

#  services.greetd = {
#    enable = true;
#    settings = rec {
#      initial_session = {
#        command = "${pkgs.dk}/bin/dk";
#        user = "xeoncpu";
#      };
#      default_session = initial_session;
#    };
#  };
    
   services.displayManager.sddm = {
      enable = true;
#      autoNumlock = true;
      wayland.enable = true;
#      theme = "catppuccin-mocha";
      #package = pkgs.kdePackages.sddm;1
    };


  #   services.displayManager.sddm = {
  #   enable = true;   
  # };
                      
                
    services = {
       
           printing.enable = true;
           printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	   avahi.enable = true;
	   avahi.nssmdns4 = true;
	   avahi.openFirewall = true;
     flatpak.enable = true;
	  # picom.enable = true;
     dbus.enable = true;
	   fstrim = {
	   enable = true;
	   interval = "weekly";
	   };
	   #unclutter-xfixes.enable = true;
	   openssh.enable = true;       
	   gvfs.enable = true;
	   tumbler.enable = true;
	#   udev.extraRules = ''
    # Your rule goes here
  #'';


#	   spice-vdagentd.enable = true;
     pipewire = {
           enable = true;
	   alsa.enable = true;
           alsa.support32Bit = true;
           pulse.enable = true;
	   };

 }; 


     services.mpd = {
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
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR =
      "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };

  services.samba-wsdd.enable = true;
  services.samba.enableNmbd = true;
  services.samba = {
         enable = true;
	 securityType = "user";
	 extraConfig = ''
	 workgroup = WORKGROUP
	 server string = smbnix
         netbios name = smbnix
         security = user
	 hosts allow = 192.168.0. 127.0.0.1 localhost
         hosts deny = 0.0.0.0/0
         guest account = xeoncpu
	 map to guest = Bad User
	 '';
	shares = {
	 public = {
	 path = "/mnt/Movies";
	 browseable = "yes";
	 "writable" = "yes";
	 "guest ok" = "yes";
	 "public" = "yes";
	 "create mask" = "0777";
      "directory mask" = "0777";
	 };
	 };
};
      # System76 Scheduler 
       services.system76-scheduler = {
                                 enable = true;
                                 settings.processScheduler.foregroundBoost.foreground.nice = 6;
                                 useStockConfig = true;
                               };

      #= IRQBalance
    #  services.irqbalance.enable = true;

#       systemd = {
#   user.services.polkit-gnome-authentication-agent-1 = {
#     description = "polkit-gnome-authentication-agent-1";
#     wantedBy = [ "graphical-session.target" ];
#     wants = [ "graphical-session.target" ];
#     after = [ "graphical-session.target" ];
#     serviceConfig = {
#         Type = "simple";
#         ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
#         Restart = "on-failure";
#         RestartSec = 1;
#         TimeoutStopSec = 10;
#       };
#   };
# };

}
