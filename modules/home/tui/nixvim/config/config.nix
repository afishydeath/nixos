{ lib, config, ... }:

{
  options = {
    config.enable = lib.mkEnableOption "enable config";
  };

  config = lib.mkIf config.config.enable {
    programs.nixvim = {
      opts = import ./opts.nix;
    };
  };

}
