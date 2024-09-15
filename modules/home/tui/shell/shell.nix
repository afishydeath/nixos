{ lib, config, ... }:

{
  imports = [
    ./zsh.nix
    ./nix-direnv.nix
  ];
  options = {
    shell.enable = lib.mkEnableOption "enable home/tui/shell config";
  };


  config = lib.mkIf config.shell.enable {
    zsh.enable = lib.mkDefault true;
    nix-direnv.enable = lib.mkDefault true;
    # too small for their own file
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
