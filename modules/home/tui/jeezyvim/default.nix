{ config, lib, pkgs, ...}:
{
  options = {
    home.tui.jeezyvim.enable = lib.mkEnableOption "enable jeezyvim";
  };
  config = lib.mkIf config.home.tui.jeezyvim.enable {
    home.packages = with pkgs; [
      jeezyvim
    ];
  };
}
