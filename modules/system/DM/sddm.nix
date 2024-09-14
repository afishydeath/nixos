{ lib, config, ... }:

{
  options = {
    sddm.enable = lib.mkEnableOption "enable sddm";
  };
  config = lib.mkIf config.sddm.enable {
    services.xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
