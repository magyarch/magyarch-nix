{ config, pkgs, ... }:

{
        services.xserver.windowManager.ratpoison.enable = true;
	#programs.river.xwayland.enable = true;
	#programs.river.extraPackages = with pkgs; [ wofi wlr-randr swww mako wlogout ];

	 environment.systemPackages = with pkgs; [
                 mesa
        

	 ];
}
