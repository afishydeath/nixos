{ lib, config, ... }:

{
  options = {
    gui.enable = lib.mkEnableOption "enable gui apps";
  };

  config = lib.mkIf config.gui.enable {
    programs.kitty.enable = true;
  };
}
