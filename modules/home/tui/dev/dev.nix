{ lib, config, ... }:

{
  imports = [
    ./git.nix
  ];
  options = {
    home.tui.dev.enable = lib.mkEnableOption "enable home/tui/dev config";
  };

  config.tui.dev = lib.mkIf config.dev.enable {
    git.enable = lib.mkDefault true;
  };
}
