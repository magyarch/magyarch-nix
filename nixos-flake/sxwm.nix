{ pkgs, ... }:
let
  sxwm = pkgs.stdenv.mkDerivation {
    pname = "sxwm";
    version = "1.7";

    src = pkgs.fetchFromGitHub {
      owner = "uint23";
      repo = "sxwm";
      rev = "v1.7";                 # a legutóbbi release
      hash = "sha256-Gytop4lYkQdVaYXWyXmlHotEFnaA0O8CZUmqfIe8X2w=";     # első buildnél kiírja a valódit, azt told be
    };

    buildInputs = with pkgs; [ libX11 libXinerama libXcursor ];

    # a Makefile alapból /usr/local-ba telepítene
    makeFlags = [ "PREFIX=${placeholder "out"}" ];
  };
in
{
  environment.systemPackages = [ sxwm ];

  services.xserver.enable = true;
  services.xserver.windowManager.session = [{
    name = "sxwm";
    start = ''
      ${sxwm}/bin/sxwm &
      waitPID=$!
    '';
  }];
}
