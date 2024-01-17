{ config, lib, pkgs, ... }:

{
    # List services that you want to enable:
    services.xserver = {
        enable = true;
	layout = "hu";
	xkbVariant = "";
	dpi = 144;
#	screenSection = ''Option "TearFree" "true"'';
       # windowManager.bspwm.configFile = "/home/xeoncpu/.config/bspwm/bspwmrc";
      # windowManager.bspwm.sxhkd.configFile = "/home/xeoncpu/.config/sxhkd/sxhkdrc";
	desktopManager = {
	            xfce = {
    enable = true;
    noDesktop = true;
    enableXfwm = false;
  };
};  
#	windowManager.herbstluftwm.package = pkgs.herbstluftwm.overrideAttrs ( o: {
#    disabledTests = o.disabledTests ++ ["test_complete_keybind_offers_additional_mods_without_duplication"];
#  });
	displayManager = {
	lightdm.enable = true;
	autoLogin = {
		enable = true;
		user = "xeoncpu";
		};
             };
           };          
         

    services = {
           printing.enable = true;
           printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	   avahi.enable = true;
	   avahi.nssmdns = true;
	   avahi.openFirewall = true;
#	   blueman.enable = true;
           dbus.enable = true;
	   # picom = {
	   # enable = true;
	   # vSync = true;
	   # };
	   fstrim = {
	   enable = true;
	   interval = "weekly";
	   };
	   unclutter-xfixes.enable = true;
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

 # Manage the virtualisation services
  # virtualisation = {
  #   libvirtd.enable = true;
  #     };

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


}
