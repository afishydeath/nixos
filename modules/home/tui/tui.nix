{ lib, config, ... }:

{
  imports = [
    ./dev/dev.nix
    ./neovim/neovim.nix
    ./shell/shell.nix
  ];

  options = {
    tui.enable = lib.mkEnableOption "tui config enable";
  };


  config = lib.mkIf config.tui.enable {
    dev.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
  };

}
