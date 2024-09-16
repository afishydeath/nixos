{ lib, config, ... }:

{
  imports = [
    ./dev/dev.nix
    ./nixvim/nixvim.nix
    ./shell/shell.nix
  ];

  options = {
    home.tui.enable = lib.mkEnableOption "tui config enable";
  };


  config.home.tui = lib.mkIf config.home.tui.enable {
    dev.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
  };

}
