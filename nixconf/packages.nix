{ config, pkgs, ... }:

let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  # List packages installed in system profile
  environment = {
    systemPackages = with pkgs; [
      alacritty
      appimage-run
      acpi
    #  aegisub
      # xorg.xhost
      bat
      # rofi
      bc
      brave
      # bmake
      binutils
      curl
      corectrl
      # dunst
      # dmenu
      # dmenu-rs-enable-plugins
      # dzen2
      distrobox
      eza
      exfat
      exfatprogs
      glib
      xfce.exo
      eww
      # feh
      ffmpeg
      firefox-bin
      filezilla
      fzf
      git
      handbrake
      # hyprshade
      htop
      # jamesdsp
#      kdePackages.kdenlive
      killall
      kitty
      imagemagick
      libnotify
      libbsd
      libva-utils
      libvdpau-va-gl
      vaapiVdpau
      # lf
      lm_sensors
      util-linux
      # librewolf
      lutris
      # lxappearance
      # lxqt.lxqt-policykit
      # lxqt.lxqt-openssh-askpass
      # kdePackages.polkit-kde-agent-1
      hyprpolkitagent
      # libbluray
      # libdvdcss
      mangohud
      # mate.mate-polkit
      mesa
      # microsoft-edge
      mpc
      ncmpcpp
      # maim
      mpv
   #   mprime
      fastfetch
      neovim
      networkmanagerapplet
      # nix-du
      nix-search-cli
      ntfs3g
      nwg-look
      # nwg-dock-hyprland
      ueberzugpp
      unrar
      unzip
      # obs-studio
      # obs-studio-plugins.wlrobs
      # onlyoffice-bin_latest
      # openrgb-with-all-plugins
      # paper-icon-theme
      # catppuccin-cursors.mochaDark
      pamixer
      pavucontrol
      # polybar
      pyprland
      protonplus
      qbittorrent
      qutebrowser
      rofi-wayland
      rmpc
      # scrot
      # smplayer
      # spectrwm
  #    shotcut
      sublime3
  #    stress-ng
      # sxhkd
      sxiv
      system-config-printer
      # stalonetray
      stremio
      # syncthing
      ventoy-full
      # vlc
      # onlyoffice-desktopeditors
      unstable.webcord
      wineWowPackages.full
      wineWowPackages.waylandFull
      # wmctrl
      wmenu
      vifm
      zellij
      # unstable.hyprland
      # xorg.libxcb
      # xmonadctl
      # xmo
      wdisplays
      # slstatus
      yt-dlp
      unstable.heroic
 #     ulauncher

      # Példa override-okra, kikommentelve
      # (picom.overrideAttrs (oldAttrs: rec {
      #   pname = "compfy";
      #   version = "1.7.2";
      #   buildInputs = [ pcre2 ] ++ oldAttrs.buildInputs;
      #   src = pkgs.fetchFromGitHub {
      #     owner = "allusive-dev";
      #     repo = "compfy";
      #     rev = version;
      #     hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
      #   };
      #   postInstall = ''''';
      # }))

    ];

    pathsToLink = [ "/libexec" ];
  };
}
