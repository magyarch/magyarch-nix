
 # My config
{ config, pkgs, ... }:


{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
      ./amdgpu.nix
 #     ./awesomewm.nix
      ./appimage.nix   
        ./bluetooth.nix
#     ./i3.nix
#       ./homem.nix
#      ./dwm.nix
 #      ./dk.nix
 #      ./river.nix
#      ./spectrwm.nix
#      ./bspwm.nix
#      ./herbst.nix
        ./wm.nix
#       ./makemkv.nix
#       ./redshift.nix
 #     ./plex.nix
#       ./sway.nix
#      ./jellyfin.nix
#       ./qtile.nix
#       ./qtile-wayland.nix
        ./hyprland.nix
#         ./wayfire.nix
#       ./nimdow.nix
#      ./xmonad.nix
#       ./xdg-default-apps.nix
    ];

 
  boot = {
     bootspec.enable = true;
    # initrd.kernelModules = [ "amdgpu" ];
  #  kernelModules = [ "bfq" ];
    #plymouth.enable = true;
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.memtest86.enable = true;
	timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
#      "amd_pstate=active"
      "kernel.nmi_watchdog=0"
#      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
   ];
    consoleLogLevel = 0;
    initrd.verbose =false;
    tmp.cleanOnBoot = true;
    kernelModules = ["tcp_bbr"];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_fastopen" = 3;
      "net.core.wmem_max" = 1073741824;
      "net.core.rmem_max" = 1073741824;
      "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
      "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };
  };


   fileSystems."/media" =
    { device = "/dev/disk/by-uuid/d8868195-b945-4761-951a-c5554e850bfc";
      fsType = "ext4";
      options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
    };


  fileSystems."/mnt" =
    { device = "/dev/disk/by-uuid/c60239a9-e693-4773-8c6c-5c15441a479d";
      fsType = "ext4";
      options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
    };

  # ZRAM
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

  nixpkgs.config.allowUnsupportedSystem = true;
  # Enable networking
  networking = {
        networkmanager.enable = true;
#	wireless.enable = true;
        hostName="nixos";
    };


  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # Configure console keymap
  console.keyMap = "hu101";

  # Select internationalisation properties.
  i18n.defaultLocale = "hu_HU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };


  nixpkgs.config = {
    allowUnfree = true;
  #  allowUnfreePredicate = pkgs.makemkv;
  #  oraclejdk.accept_license = true;
    joypixels.acceptLicense = true;
  };

   
  services.hardware.openrgb.enable = true;
   services.xserver.serverFlagsSection = 
    ''
    Option "StandbyTime" "0" 
    Option "BlankTime" "0"
    Option "SuspendTime" "0"
    Option "OffTime" "0"
    '';

  # Enable sound with pipewire.
  #sound.enable = true;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xeoncpu = {
    isNormalUser = true;
    description = "xeoncpu";
    extraGroups = [ "networkmanager" "wheel" "input" "disk" "power" "samba" ];
   # packages = with pkgs; [
    #  firefox
    #  thunderbird
    #];
  };

  # security.sudo.extraRules = [{
  #    users = [ "xeoncpu" ];
  #    commands = [{command = "ALL";
  #    options = ["NOPASSWD"];
  #    }];
  # }];

  programs.ssh = {
    enableAskPassword = true;
    askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
  };
  #programs = { steam.gamescopeSession.enable = true; };
  programs = {
	   dconf.enable = true;
     corectrl.enable = true;
     coolercontrol.enable = true;
     gamemode.enable = true;
     gamescope.enable = true;
     steam = {
	           enable = true;
             gamescopeSession.enable = true;
             remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
             dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#             package = pkgs.steam.override {
#             extraPkgs = pkgs: with pkgs; [
#                  gamescope
#        ];

	   };
 #   }; 

	   thunar = {
	   enable = true;
	   plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];
           };
	   tmux = {
           enable = true;
           extraConfig = ''
      # Set the base index for windows to 1 instead of 0
        set -g base-index 1

      # set the status line's colors
        set -g status-style fg=white,bg=blue

      # Change prefix from 'Ctrl+B' to 'Ctrl+A'
        unbind C-b
        set-option -g prefix C-space
        bind-key C-space send-prefix

       # Enable mouse mode
         set -g mouse on

       # Use xclip to copy and paste with the system clipboard
         bind C-c run "tmux save-buffer - | xclip -i -sel clip"
         bind C-v run "tmux set-buffer $(xclip -o -sel clip); tmux paste-buffer"

       # more intuitive splits
       # splitting panes with | and -
        bind + split-window -h
        bind - split-window -v
        bind r source-file /etc/tmux.conf \; display "Reloaded!"

	bind-key -r S-Left swap-window -d -t -1
        bind-key -r S-Right swap-window -d -t +1
        bind M-j swap-pane -D
	bind M-k swap-pane -U

       # kill K k
        unbind k
        bind k confirm-before "kill-window"
        unbind K
        bind K confirm-before "kill-server"
  '';
};

  };


 # Enable zsh as default shell
  users.defaultUserShell = pkgs.zsh;
   programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      shellAliases = {
         nrs="sudo nixos-rebuild switch";
         ncu="sudo nix-channel --update nixos";
         addunstable="sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos";
         nixupgrade="sudo nixos-rebuild switch --upgrade-all";
         rmoldgen="sudo nix-collect-garbage -d";
         rebuildboot="sudo /run/current-system/bin/switch-to-configuration boot";
         runheroic="~/Letöltések && appimage-run Heroic-2.9.1.AppImage";
         listgens="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
         fixnonixsearchpath="sudo nixos-rebuild boot -I nixos-config=/etc/nixos/configuration.nix --upgrade";
         listallinstalled="sudo nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";

         # Shorts
          ka="killall";
          mkd="mkdir -pv";
          cp="cp -iv";
          mv="mv -iv";
          rm="rm -vI";
          SS="sudo systemctl";
          f="$FILE";
          e="$EDITOR";
          v="vifmrun";
          z="zathura";
          x="sxiv -ft *";
          sdn="sudo shutdown -h now";
          sr="sudo reboot";
          diff="diff --color=auto";
          q="exit";
          df="df -h";
          jctl="journalctl -p 3 -xb";

          #chmod +x
           ch="sudo chmod +x ";

        #Delete [Important - use carefully]
          delete="sudo rm -rf ";
         #free
          free="free -mt";

         #continue download
          wget="wget -c";


       };

  };
  
  # xdg.portal = {
  #   enable = true;
  #   config.common.default = "*";
  #   extraPortals = [pkgs.xdg-desktop-portal-gtk];
  # };

  fonts.packages = with pkgs; [
    noto-fonts-emoji
    font-awesome_4
    source-code-pro
    joypixels
    dejavu_fonts
    liberation_ttf
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  # Suckless Tools
  nixpkgs.overlays = [
    (final: prev: {
#      dwm = prev.dwm.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dwm ;});
      dmenu = prev.dmenu.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dmenu ;});
      #slstatus = prev.slstatus.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/slstatus ;});
      #myslstatus = final.slstatus.overrideAttrs (_: { src = /home/xeoncpu/.config/suckless/slstatus ;});
    })
  ];
  

 # Curiously, `services.samba` does not automatically open
  # the needed ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 445 139 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

   # Automatic Updates
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-24.05";
  };


   # Nix Package Management
  nix = {
    settings.auto-optimise-store = true;
   # settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];
  #nix.settings.auto-optimise-store = true;
  
}
