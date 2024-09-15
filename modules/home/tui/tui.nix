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

  dev.enable = lib.mkDefault config.tui.enable;
  neovim.enable = lib.mkDefault config.tui.enable;
  shell.enable = lib.mkDefault config.tui.enable;

  config = lib.mkIf config.tui.enable {
    # something
  };

}
