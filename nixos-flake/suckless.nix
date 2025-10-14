{ pkgs, ... }:

{

    (pkgs.dmenu.overrideAttrs (_: {
      src = ~/.config/suckless/dmenu;
      patches = [ ];
    }))
  ];
}
