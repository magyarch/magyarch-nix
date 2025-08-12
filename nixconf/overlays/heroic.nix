self: super:

let
  version = "2.17.0";
  pname = "heroic";
  url = "https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v${version}/heroic-${version}.tar.xz";
in {
  heroic-custom = super.stdenv.mkDerivation {
    inherit pname version;

    src = super.fetchurl {
      url = url;
      sha256 = "40d99d7ebab6a075ddb8063d7b1b2a0ef4fb6a0d86e9d7d4da261aa6a76c9c1a"; # Lásd lent
    };

    nativeBuildInputs = [ super.makeWrapper ];

    installPhase = ''
      mkdir -p $out/opt/heroic
      tar -xf $src -C $out/opt/heroic --strip-components=1

      mkdir -p $out/bin
      makeWrapper $out/opt/heroic/heroic $out/bin/heroic \
        --set ELECTRON_IS_DEV 0
    '';

    meta = with super.lib; {
      description = "Heroic Games Launcher (native unpacked version)";
      homepage = "https://heroicgameslauncher.com/";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
}

