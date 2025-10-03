
 # My config
{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./amdgpu.nix
    # ./nvidia.nix
    # ./nvidia-fan-daemon.nix
    # ./awesomewm.nix
#    ./appimage.nix
#    ./bluetooth.nix
    # ./bspwm.nix
    # ./cinnamon.nix
    # ./i3.nix
     ./dwm.nix
    ./plex.nix
    # ./ratpoison.nix
    # ./spectrwm.nix
#     ./hyprland.nix
#     ./herbst.nix
    ./wm.nix
    # ./makemkv.nix
    # ./redshift.nix
    ./ssh.nix
    ./samba.nix
    # ./plex.nix
 #    ./sway.nix
    # ./jellyfin.nix
    # ./qtile.nix
 #    ./sddm.nix
    #./hyprland.nix
 #    ./stump.nix
    # ./xmonad.nix
#     ./niri.nix
  ];

  boot = {
    bootspec.enable = true;

    initrd.kernelModules = [ "amdgpu" "tcp_bbr" ];

    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_low_latency" = 1;
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_max" = 16777216;
      "net.ipv4.tcp_rmem" = "4096 87380 16777216";
      "net.ipv4.tcp_wmem" = "4096 65536 16777216";

      "kernel.sched_latency_ns" = 10000000;
      "kernel.sched_min_granularity_ns" = 1000000;
      "kernel.sched_wakeup_granularity_ns" = 1500000;

    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.memtest86.enable = true;
      timeout = 1;
    };

    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    kernelParams = [
#       "amd_pstate=active"
#      "amdgpu.ppfeaturemask=0xffffffff"
#      "amdgpu.async_gfx_ring=1"
#      "amdgpu.dc=1"
      "nmi_watchdog=0"
#      "split_lock_mitigate=0"
      # "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      #"console=tty1"
      # "nvidia-drm.modeset=1"
    ];

    consoleLogLevel = 0;
    initrd.verbose = false;
    tmp.cleanOnBoot = true;
  };


    systemd.services."NetworkManager-wait-online".enable = false;

    fileSystems."/media" =
     { device = "/dev/disk/by-uuid/862572ff-ab09-452e-a020-221bbfa598a2";
       fsType = "ext4";
       options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
     };


    fileSystems."/mnt" =
     { device = "/dev/disk/by-uuid/3a2e5190-91e1-4c8b-b648-f4903369255f";
       fsType = "ext4";
       options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
    };

  # ZRAM
  zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 50;
      priority = 100;
    };

 # nixpkgs.config.allowUnsupportedSystem = true;
 # nixpkgs.config.allowUnfree = true;
 # nixpkgs.config.nvidia.acceptLicense = true;
  # Enable networking
  networking.networkmanager = {
        enable = true;
      };
  networking.hostName="nixos";


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
    allowUnsupportedSystem = true;
  #allowBroken = true;
   nvidia.accept_license = true;
    joypixels.acceptLicense = true;
  };


  # services.hardware.openrgb.enable = true;
  #  services.xserver.serverFlagsSection =
  #   ''
  #   Option "StandbyTime" "0"
  #   Option "BlankTime" "0"
  #   Option "SuspendTime" "0"
  #   Option "OffTime" "0"
  #   '';

  # Enable sound with pipewire.
  #sound.enable = true;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xeoncpu = {
    isNormalUser = true;
    description = "xeoncpu";
   extraGroups = [ "users" "audio" "video" "networkmanager" "wheel" "input" "disk" "samba" "kwm" ];
   # packages = with pkgs; [
    #  firefox
    #  thunderbird
    };

    #virtualisation.docker.enable = true;
   security.sudo.extraRules = [{
      users = [ "xeoncpu" ];
      commands = [{command = "ALL";
      options = ["NOPASSWD"];
      }];
   }];

  programs = {
     dconf.enable = true;
  #   coolercontrol.enable = true;
     file-roller.enable = true;
     gamemode.enable = true;
     gamescope = {
      enable = true;
      capSysNice = true;
    };
     steam = {
	           enable = true;
 #            gamescopeSession.enable = true;
             remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
             dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };





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
         nrs="cd ~/nixos-flake && sudo nixos-rebuild switch --flake .#nixos";
         addunstable="sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos";
         addstable="sudo nix-channel --add https://nixos.org/channels/nixos-25.05 nixos";
         nixos-upgrade="cd ~/nixos-flake && nix flake update && sudo nixos-rebuild switch --flake .#nixos";
         rmoldgen="sudo nix-collect-garbage -d";
         rebuildboot="sudo /run/current-system/bin/switch-to-configuration boot";
        # runheroic="~/Letöltések && appimage-run Heroic-2.9.1.AppImage";
         listgens="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
         fixnonixsearchpath="sudo nixos-rebuild boot -I nixos-config=/etc/nixos/configuration.nix --upgrade";
         listallinstalled="sudo nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
        # gscope="gamescope -w 1920 -h 1080 -W 2560 -H 1440 -f -F fsr -e  -- steam -tenfoot";


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
          sp="sudo poweroff";
          diff="diff --color=auto";
          q="exit";
          df="df -h";
          jctl="journalctl -p 3 -xb";
          dea="distrobox enter archlinux";
          ch="sudo chmod +x";

        #Delete [Important - use carefully]
          delete="sudo rm -rf ";
         #free
          free="free -mt";

         #continue download
          wget="wget -c";


       };

  };

#      # Suckless Tools
#    nixpkgs.overlays = [
#      (final: prev: {
# # #      dwm = prev.dwm.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dwm ;});
# #       dmenu = prev.dmenu.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/dmenu ;});
#       tabbed = prev.st.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/tabbed ;});
#      })
#    ];

  fonts.packages = with pkgs; [
    noto-fonts-emoji
    font-awesome_4
    source-code-pro
    joypixels
    dejavu_fonts
    terminus_font
    terminus_font_ttf
    liberation_ttf
    nerd-fonts.jetbrains-mono
  #  (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  networking.firewall.allowedTCPPorts = [ 445 139 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

   # Automatic Updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly"; # csak hetente egyszer fusson, nem bootnál
    persistent = true;
    randomizedDelaySec = "30min";
    channel = "https://nixos.org/channels/nixos-25.05";
  };


   # Nix Package Management
  nix = {
    settings.auto-optimise-store = true;
    settings.download-buffer-size = 524288000;
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w" "qbittorrent-4.6.4" "ventoy-1.1.05"
              ];
  #nix.settings.auto-optimise-store = true;

}
