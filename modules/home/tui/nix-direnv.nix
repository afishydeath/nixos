{ lib, config, ... }:

{
  options = {
    nix-direnv.enable = lib.mkEnableOption "enable nix-direnv";
  };
  config = lib.mkIf config.nix-direnv.enable {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}
