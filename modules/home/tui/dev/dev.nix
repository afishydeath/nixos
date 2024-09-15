{ lib, config, ... }:

{
  imports = [
    ./git.nix
  ];
  options = {
    dev.enable = lib.mkEnableOption "enable home/tui/dev config";
  };

  config = lib.mkIf config.dev.enable {
    git.enable = lib.mkDefault true;
  };
}
