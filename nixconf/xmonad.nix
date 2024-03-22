{ config, pkgs, ...}:

{
  services.xserver.displayManager.defaultSession = "none+xmonad";
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPackages: [
      haskellPackages.dbus
      haskellPackages.List
      haskellPackages.monad-logger
      haskellPackages.xmobar
      ];
  };

  services.xserver.windowManager.xmonad.config = builtins.readFile /home/xeoncpu/.config/xmonad/xmonad.hs;

   environment.systemPackages = with pkgs; [
               haskellPackages.xmonad_0_18_0
  ];
}
