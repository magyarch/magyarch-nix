 # My config
{ config, pkgs, ... }:

{
  

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
    ];

  # Use the systemd-boot EFI boot loader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
	timeout = 1;
    };


  boot = {
    initrd.kernelModules = [ "amdgpu" ];
  #  kernelModules = [ "bfq" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
    #  "amd_pstate=active"
   ];
    tmp.cleanOnBoot = true;
   # swraid.enable = false;
  };


  fileSystems."/media" =
    { device = "/dev/disk/by-uuid/41e88a43-a279-4c8d-b76c-b4e9031ff39c";
      fsType = "auto";
      options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
    };


  fileSystems."/mnt" =
    { device = "/dev/disk/by-uuid/a7228798-548b-470e-a9d9-36da26cc5af2";
      fsType = "auto";
      options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
    };

  # ZRAM
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50;

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
  #  oraclejdk.accept_license = true;
    joypixels.acceptLicense = true;
  };


   # Videodriver configuration
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl = {
           enable = true;
     driSupport = true;
     driSupport32Bit = true;
     extraPackages = with pkgs; [ rocm-opencl-icd
  rocm-opencl-runtime ];
     };


  # Enable sound with pipewire.
  #sound.enable = true;
  security.rtkit.enable = true;
  
  hardware.bluetooth = {
           enable = true;
           powerOnBoot = true;
           };
  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xeoncpu = {
    isNormalUser = true;
    description = "xeoncpu";
    extraGroups = [ "networkmanager" "wheel" "input" "disk" "kvm" "libvirtd" ];
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };


  programs = {
           corectrl.enable = true;
           gnome-disks.enable = true;
	   gamemode.enable = true;
	   nm-applet.enable = true;
           file-roller.enable = true;
           direnv.enable = true;
	   dconf.enable = true;
           steam = {
	   enable = true;
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


 xdg.portal = {
     enable = true;
     extraPortals = with pkgs; [
     xdg-desktop-portal-gtk
   ];
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

  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    font-awesome_4
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
#      st = prev.st.overrideAttrs (old: { src = /home/xeoncpu/.config/suckless/st ;});
    })
  ];

  security.polkit.enable = true;
    systemd = {
   user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
   extraConfig = ''
     DefaultTimeoutStopSec=10s
   '';
 };


 # Curiously, `services.samba` does not automatically open
  # the needed ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 445 139 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

#  nix.extraOptions = ''
#      keep-outputs = true
#      keep-derivations = true
#      experimental-features = nix-command flakes
#      '';
  
  nix.settings.auto-optimise-store = true;

  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 5d";

};

}
