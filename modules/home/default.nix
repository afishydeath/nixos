{ lib, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./tui.nix
  ];
  
  colorScheme = inputs.nix-colors.colorSchemes.${inputs.theme};
  
  tui.enable = lib.mkDefault true;

}
