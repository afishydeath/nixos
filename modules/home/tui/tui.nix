{ lib, config, ... }:

{
  imports = [
    ./dev/dev.nix
    ./nixvim/nixvim.nix
    ./jeezyvim
    ./shell/shell.nix
  ];

  options = {
    home.tui.enable = lib.mkEnableOption "tui config enable";
  };


  config.home.tui = lib.mkIf config.home.tui.enable {
    dev.enable = lib.mkDefault true;
    jeezyvim.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
  };

}
