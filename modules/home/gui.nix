{ lib, config, ... }:

{
  options = {
    gui.enable = config.mkEnableOption "enable gui apps";
  };

  config = lib.mkIf config.gui.enable {
    programs.kitty.enable = true;
  };
}
