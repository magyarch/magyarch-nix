# My config
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Budapest";

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

  # Enable the X11 windowing system.
#  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
	enable = true;
	layout = "hu";
	xkbVariant = "";
	windowManager.i3.enable = true;
	displayManager = {
		defaultSession = "none+i3";
		lightdm.enable = true;
		autoLogin = {
			enable = true;
			user = "xeoncpu";
		};
             };
	};

  # Enable the Pantheon Desktop Environment.
#  services.xserver.displayManager.lightdm.enable = true;
#  services.xserver.windowManager.spectrwm.enable = true;
#  services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11
 # services.xserver = {
    #layout = "hu";
   # xkbVariant = "";
  #};

  # Configure console keymap
  console.keyMap = "hu101";

  # Enable CUPS to print documents.
  services = {
           printing.enable = true;
           printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	   avahi.enable = true;
	   avahi.nssmdns = true;
	   avahi.openFirewall = true;
           dbus.enable = true;
	   picom.enable = true;
	   unclutter-xfixes.enable = true;
	  }; 

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
#    services.unclutter.enable = true;
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

  # Enable automatic login for the user.
#  services.xserver.displayManager.autoLogin.enable = true;
 # services.xserver.displayManager.autoLogin.user = "xeoncpu";


 # Enable dconf (System Management Tool
  programs.dconf.enable = true;

  programs.tmux = {
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

 # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

 xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
};

 programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   };

# Enable zsh as default shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };

  fonts.fonts = with pkgs; [
    noto-fonts-emoji
    dejavu_fonts
    liberation_ttf
    source-code-pro
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
           enable = true;
	   driSupport = true;
           driSupport32Bit = true;
	  }; 

  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  hardware.nvidia = {
           forceFullCompositionPipeline = true;
	   nvidiaSettings = true;
	   package = config.boot.kernelPackages.nvidiaPackages.stable;
	  }; 

  # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway
  #hardware.nvidia.modesetting.enable = true;
#  services.udev.extraRules = ''
      # DualShock 4 over bluetooth hidraw
 #     KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0660", TAG+="uaccess"
  #'';

environment.variables.EDITOR = "nvim";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  #   vim
     alacritty
     mpv
     ueberzug
     exa
     htop
     vifm
     git
     discord
     dmenu
     unzip
     unrar
     xclip
     neovim
     neofetch
     maim
    killall
    i3blocks
   # unclutter
    mpd
    ncmpcpp
    feh
    xwallpaper
    sxiv
    fzf
    sxhkd
    ffmpeg
    lxappearance
    pavucontrol
    pulseaudio
    pamixer
    pulsemixer
    playerctl
    cpu-x
    bc
    lm_sensors
    bat
    curl
    binutils
    s-tui
    ntfs3g
    atool
    zip
    p7zip
    acpi
    xcape
    xdo
    xdotool
    glib
    dunst
    rofi
    qbittorrent
    heroic
    brave
    microsoft-edge
    xdg-user-dirs
    libnotify
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    system-config-printer
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

  services.samba-wsdd.enable = true;
  services.samba = { 
         enable = true; 
	 securityType = "user";
	 extraConfig = '' 
	 workgroup = WORKGROUP 
	 server string = smbnix
         netbios name = smbnix
         security = user 
	 hosts allow = 192.168.0. 127.0.0.1 localhost
         hosts deny = 0.0.0.0/0
         guest account = xeoncpu
	 map to guest = Bad User 
	 ''; 
	shares = {
	 public = { 
	 path = "/mnt/Movies"; 
	 browseable = "yes";  
	 "writable" = "yes"; 
	 "guest ok" = "yes"; 
	 "public" = "yes"; 
	 "create mask" = "0777";
      "directory mask" = "0777";
	 }; 
	 }; 
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
