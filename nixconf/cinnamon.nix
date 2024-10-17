{ config, pkgs, ... }:

{

services.xserver = {  
	enable = true;  
#	libinput.enable = true;  
	displayManager.lightdm.enable = true;  
	desktopManager = {  
		cinnamon.enable = true;  
	};  
	displayManager.defaultSession = "cinnamon";  
};
   
   hardware.pulseaudio.enable = false;

}
