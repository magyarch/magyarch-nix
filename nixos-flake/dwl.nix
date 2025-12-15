{ config, unstable, pkgs, ... }:

{

programs.dwl = {
    enable = true;
     package = (pkgs.dwl.overrideAttrs (oldAttrs: {src = ./local-packages/dwl;
  buildInputs =
    oldAttrs.buildInputs or []
    ++ [
      pkgs.libdrm
      pkgs.fcft
      pkgs.wlroots_0_19
    ];
}));

#		  src = ./local-packages/dwl;
 #        src = ./config/suckless/dwm;
#		  };

    extraSessionCommands = " 
    swaybg -i ./local-packages/wallpaper/xy.png >/dev/null 2>&1 
     slstatus -s | dwl 
    wlr-randr --output DP-2 --scale 1.25 
    ";
};
   
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["wlr"];
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal
      ];
    };


environment.systemPackages = with pkgs; [
  wayland
  wayland-protocols
  #unstable.wlroots
  foot
  git
  wmenu
  wl-clipboard
  grim
  slurp
  swaybg
  slstatus
  firefox
  jetbrains-mono
   (pkgs.slstatus.overrideAttrs (_: {
      src = ./local-packages/slstatus;
      patches = [ ];
    }))

  ];
  

}
