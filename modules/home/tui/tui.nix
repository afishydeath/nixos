{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./dev/dev.nix
    ./nixvim/nixvim.nix
    ./jeezyvim
    ./shell/shell.nix
  ];

  options = {
    home.tui.enable = lib.mkEnableOption "tui config enable";
  };

  config = lib.mkIf config.home.tui.enable {
    home.tui = {
      dev.enable = lib.mkDefault true;
      jeezyvim.enable = lib.mkDefault true;
      shell.enable = lib.mkDefault true;
    };
    home.packages = with pkgs; [
      unzip
      parted
    ];
  };
}
