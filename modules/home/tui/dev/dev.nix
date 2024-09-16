{ lib, config, ... }:

{
  imports = [
    ./git.nix
  ];
  options = {
    home.tui.dev.enable = lib.mkEnableOption "enable home/tui/dev config";
  };

  config.home.tui.dev = lib.mkIf config.home.tui.dev.enable {
    git.enable = lib.mkDefault true;
  };
}
