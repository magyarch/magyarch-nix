{config,pkgs, lib, ... }:
{
  services.xserver.windowManager.stumpwm = {
                                enable = true;
#				package = pkgs.sbcl.stumpwm;
				};
}
