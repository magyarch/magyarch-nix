{ lib, config, ... }:

let
  cfg = config.custom.kernel;
in
{
  options.custom.kernel.enable =
    lib.mkEnableOption "custom latest kernel config";

  config = lib.mkIf cfg.enable {

    nixpkgs.overlays = [
      (final: prev: {
        linuxPackages_latest =
          prev.linuxPackages_latest.extend (kfinal: kprev: {
            kernel = kprev.kernel.override {
              structuredExtraConfig = with lib.kernel; {
                HZ_1000 = yes;
                HZ = freeform "1000";
                PREEMPT_FULL = yes;
                IOSCHED_BFQ = yes;
                DEFAULT_BFQ = yes;
                DEFAULT_IOSCHED = freeform "bfq";
                V4L2_LOOPBACK = module;
                HID = yes;
              };
            };
          });
      })
    ];
   };
 }

