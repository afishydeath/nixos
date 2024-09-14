{ lib, userSettings, ... }:

{
  imports = [
    ./tui.nix
  ];
  
  tui.enable = lib.mkDefault true;

  stylix = userSettings.stylixSettings;
}
