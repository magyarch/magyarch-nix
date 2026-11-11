{ config, pkgs, ... }:

{

services.xserver.enable = true;

#	libinput.enable = true;  
services = {	
    displayManager.lightdm.enable = true;  
	desktopManager = {  
		cinnamon.enable = true;  
	};  
};
   
   services.pulseaudio.enable = false;

}
