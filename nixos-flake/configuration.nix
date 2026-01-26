
 # My config
{ config, pkgs, inputs, unstable, ... }:

{
  imports = [
    # Include the results of the hardware scan.
#    ./hardware-configuration.nix
    ./kernel.nix
    ./packages.nix
    ./services.nix
    ./amdgpu.nix
    # ./nvidia.nix
     ./env.nix
    ./appimage.nix
    ./gamemode.nix
  #   ./bspwm.nix
    # ./i3.nix
#     ./dwm.nix
 #    ./xdg.nix
    ./plex.nix
    # ./ratpoison.nix
#     ./spectrwm.nix
    # ./hyprland.nix
#     ./herbst.nix
#    ./wm.nix
    ./ssh.nix
    ./samba.nix
     ./bluetooth.nix
     ./sway.nix
    # ./jellyfin.nix
    # ./qtile.nix
 #    ./sddm.nix
 #    ./stump.nix
#      ./mango.nix
#     ./xmonad.nix
#     ./niri.nix
     ./noctalia.nix
#      ./oxwm.nix
#       ./dms.nix
    inputs.dms.nixosModules.dank-material-shell
  ];

   custom.kernel.enable = true;

   boot = {
      bootspec.enable = true;

      kernelPackages = pkgs.linuxPackages_latest;

      initrd.kernelModules = [ "amdgpu" ];

      loader = {
#        grub.enable = false;  
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.memtest86.enable = true;
        timeout = 1;
      };

      kernelParams = [
        "amd_pstate=active"
        "nosplit_lock_mitigate"
        "clearcpuid=514"
        "elevator=bfq"
#        "amdgpu.ppfeaturemask=0xffffffff"
      ];

      kernel.sysctl = {
        "kernel.split_lock_mitigate" = 0;
        "vm.swappiness" = 10;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_bytes" = 268435456;
        "vm.max_map_count" = 16777216;
        "vm.dirty_background_bytes" = 67108864;
        "vm.dirty_writeback_centisecs" = 1500;
        "kernel.nmi_watchdog" = 0;
        "kernel.unprivileged_userns_clone" = 1;
        "kernel.printk" = "3 3 3 3";
        "kernel.kptr_restrict" = 2;
        "kernel.kexec_load_disabled" = 1;
      };

      consoleLogLevel = 0;
      initrd.verbose = false;
      tmp.cleanOnBoot = true;
    };


 zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 50;
      priority = 100;
    };

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

 fileSystems."/mnt" =
{ device = "/dev/disk/by-uuid/655a6ae3-944b-47ed-b579-15f3b0e5d2d4";
fsType = "ext4";
options = [ "defaults" "nofail" ];

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

  security.rtkit.enable = true;

#xdg.portal = {
#    enable = true;
#    extraPortals = [
#      pkgs.xdg-desktop-portal-gtk  # GTK alkalmazásokhoz
    #  pkgs.xdg-desktop-portal-hyprland # Hyprland használata esetén
#    ];
#    config.common.default = "*"; # opcionális
#  };

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
   #  nix-ld.enable = true;
     dank-material-shell = {
     enable = true;
      enableSystemMonitoring = true;
  dgop.package = inputs.dgop.packages.${pkgs.system}.default;
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
         cdn="cd ~/nixos-flake";
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
         fman="compgen -c | fzf | xargs man";
         ls="eza --no-filesize --long --color=always --icons=always --no-user"; 


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


  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
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


#  networking.firewall.allowedTCPPorts = [ 445 139 ];
#  networking.firewall.allowedUDPPorts = [ 137 138 ];
  
  
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

  system.stateVersion = "25.11"; # Did you read the comment?

  nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w" "ventoy-1.1.07" "mbedtls-2.28.10" "qtwebengine-5.15.19" 
              ];
  

}
