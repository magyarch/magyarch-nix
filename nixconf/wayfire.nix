{ config, pkgs, ... }:


{

programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
         wcm
         wf-shell
         wayfire-plugins-extra
    ];
    #xwayland.enable = true;
  };

  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
	                     meson
			             grim
                         clapper
                         mako
			             swww
                         swappy
                         slurp
                       #  wayland-protocols
                         #hyprlandPlugins.hy3
                        # wayland-utils
                         #xwayland
                         wl-clipboard
                         #wlroots
                         wlogout
                         wlsunset
                         wlprop
			             wofi
                         wf-recorder
                         waybar
                         wlrctl
                         wtype
                         dotool
                         jq
                         copyq
	 		 ];

}             