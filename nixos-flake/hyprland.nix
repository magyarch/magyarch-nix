{ config, pkgs, inputs, ... }:  


 {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
#	                       unstable.hyprland
                         #meson
			                   mako
			                   swww
                         #swappy
                         slurp
                         hyprland-protocols
			             hyprpolkitagent
                         hyprshot
                         hyprshade
			             hyprpaper
                         wayland-utils
                         #xwayland
                         wl-clipboard

                         wlroots
                         wlogout
                         wlsunset
                         #wlprop
                         #wlr-randr
            			 wofi
                         wf-recorder
                         wl-screenrec
                         waybar
                         jq
	 		 ];
    
  
}
