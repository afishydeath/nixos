{ lib, config, ... }:

{
  imports = [
    ./nixvim.nix
  ];
  options = {
    neovim.enable = lib.mkEnableOption "enable home/tui/neovim config";
  };

  nixvim.enable = lib.mkDefault config.neovim.enable;

  config = lib.mIf config.neovim.enable {
    # something
  };
}
