{ config, pkgs, ... }:

{
	programs.river.enable = true;
	programs.river.xwayland.enable = true;
	programs.river.extraPackages = with pkgs; [ wofi waybar wlr-randr swww mako wlogout ];

	 environment.systemPackages = with pkgs; [
                 xwayland
                 mesa
                 wlroots
                 wayland-protocols
                 wayland
                 swayws

	 ];
}
