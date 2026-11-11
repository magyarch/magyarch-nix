{ config, lib, pkgs, ... }:

{
        
  services.displayManager.ly = {
       enable = true;   
};
   
    services = {
           printing.enable = true;
           printing.drivers = [ pkgs.hplip pkgs.hplipWithPlugin ];
	   avahi.enable = true;
	   avahi.nssmdns4 = true;
	   avahi.openFirewall = true;
          flatpak.enable = true;
     dbus.enable = true;
     irqbalance.enable = true;
	   fstrim = {
	   enable = true;
	   interval = "weekly";
	   };
#	   openssh.enable = true;       
	   gvfs.enable = true;
       udev.packages = [ pkgs.libmtp ];
	   tumbler.enable = true;

     pipewire = {
           enable = true;
	   #alsa.enable = true;
#           alsa.support32Bit = true;
           pulse.enable = true;
       };

#    cpupower-gui.enable = true;

    mpd = {
    enable = true;
    user = "xeoncpu";
    settings.music_directory = "/mnt/Zenék";
    startWhenNeeded =
      true; # systemd feature: only start MPD service upon connection to its socket
  };
};
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR =
      "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };


#   virtualisation.podman = {
#  enable = true;
#  dockerCompat = true;
# };

      
}
