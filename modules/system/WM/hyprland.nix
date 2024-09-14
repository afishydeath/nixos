{ lib, config, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    services.xserver = {
      enable = true;
    };

    programs.hyprland.enable = true;

  };
}
