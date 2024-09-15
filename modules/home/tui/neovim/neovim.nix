{ lib, config, ... }:

{
  imports = [
    ./nixvim.nix
  ];
  options = {
    neovim.enable = lib.mkEnableOption "enable home/tui/neovim config";
  };


  config = lib.mkIf config.neovim.enable {
    nixvim.enable = lib.mkDefault true;
  };
}
