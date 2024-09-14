{ lib, config, ... }:

{
  options = {
    lightdm.enable = lib.mkEnableOption "enable lightdm";
  };
  config = lib.mkIf config.lightdm.enable {
    services.xserver = {
      enable = true;
      displayManager.lightdm = {
        enable = true;
      };
    };
  };
}
