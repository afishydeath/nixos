{ lib, config, ... }:

{
  imports = [
    ./dev/dev.nix
    ./nixvim/nixvim.nix
    ./shell/shell.nix
  ];

  options = {
    tui.enable = lib.mkEnableOption "tui config enable";
  };


  config = lib.mkIf config.tui.enable {
    dev.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
  };

}
