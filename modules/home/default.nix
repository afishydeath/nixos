{ lib, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./tui.nix
  ];
  
  colorScheme = inputs.nix-colors.colorSchemes.everforest;
  
  tui.enable = lib.mkDefault true;

}
