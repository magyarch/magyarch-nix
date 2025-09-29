{ config, pkgs, ... }:

{
	programs.river.enable = true;
	#programs.river.xwayland.enable = true;
	programs.river.extraPackages = with pkgs; [ wofi wlr-randr swww mako wlogout ];

	 environment.systemPackages = with pkgs; [
                 mesa
                 wlroots
                 wayland-protocols
                 wayland-utils
                 wayland
                 sandbar
                 grim
                 slurp
                 swappy

	 ];
}
