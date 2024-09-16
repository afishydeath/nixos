{ lib, userSettings, ... }:

{
  imports = [
    ./tui/tui.nix
    ./gui.nix
  ];

  home = {
    tui.enable = lib.mkDefault false;
    gui.enable = lib.mkDefault false;
  };

  stylix = userSettings.stylixSettings;
}
