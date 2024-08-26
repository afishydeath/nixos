{ lib, ... }:

{
  imports = [
    ./tui.nix
  ];
  
  tui.enable = lib.mkDefault true;

}
