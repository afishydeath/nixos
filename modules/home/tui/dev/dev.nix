{ lib, config, ... }:

{
  imports = [
    ./git.nix
  ];
  options = {
    dev.enable = lib.mkEnableOption "enable home/tui/dev config";
  };

  git.enable = lib.mkDefault config.dev.enable;

  config = lib.mIf config.dev.enable {
    # something
  };
}
