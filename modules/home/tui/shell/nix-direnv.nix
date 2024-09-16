{ lib, config, ... }:

{
  options = {
    home.tui.shell.nix-direnv.enable = lib.mkEnableOption "enable nix-direnv";
  };
  config = lib.mkIf config.home.tui.shell.nix-direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
