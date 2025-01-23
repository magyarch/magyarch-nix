{ config, pkgs, ... }: 


 {


  programs.hyprland = {
    enable = true;
#    package = pkgs.unstable.hyprland;
           
  };


#env var
  environment.variables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  
# List packages installed in system profile
    environment.systemPackages = with pkgs; [
	                       meson
			                   grim
                         mako
			                   swww
                         swappy
                         slurp
                         hyprland-protocols
                         hyprshot
                         hyprshade
                         pyprland  
                         #hyprlandPlugins.hy3
                         wayland-utils
                         #xwayland
                         wl-clipboard

                         wlroots
                         wlogout
                         wlsunset
                         wlprop
                         wlr-randr
			                   wofi
                         wf-recorder
                         waybar
                         dotool
                         jq
                         copyq
                         cliphist
	 		 ];

    nixpkgs.overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
        });

        
      })
     ];
    
  
}
