{ lib, inputs, userSettings, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./tui.nix
  ];
  
  colorScheme = inputs.nix-colors.colorSchemes.${userSettings.theme};
  
  tui.enable = lib.mkDefault true;

}
