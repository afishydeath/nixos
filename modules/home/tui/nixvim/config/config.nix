{ lib, config, ... }:

{
  options = {
    home.tui.nixvim.config.enable = lib.mkEnableOption "enable config";
  };

  config = lib.mkIf config.home.tui.nixvim.config.enable {
    programs.nixvim = {
      opts = import ./opts.nix;
      globals = import ./globals.nix;
    };
  };

}
