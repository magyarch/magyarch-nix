{ config, pkgs, ... }:

{

	services.xserver.windowManager.nimdow.enable = true;
	#services.xserver.windowManager.nimdow.package = [ "pkgs.nimdow" ];
	services.xserver.displayManager.defaultSession = "none+nimdow";
}