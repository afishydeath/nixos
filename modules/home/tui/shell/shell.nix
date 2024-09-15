{ lib, config, ... }:

{
  imports = [
    ./zsh.nix
    ./nix-direnv.nix
  ];
  options = {
    dev.enable = lib.mkEnableOption "enable home/tui/shell config";
  };

  zsh.enable = lib.mkDefault config.shell.enable;
  nix-direnv.enable = lib.mkDefault config.shell.enable;

  config = lib.mIf config.shell.enable {
    # too small for their own file
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
