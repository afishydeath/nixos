{ lib, ... }:

{
  options = {
    home.tui.nixvim.plugins.enable = lib.mkEnableOption "enable plugins";
  };

  imports = [
    
  ];
}
