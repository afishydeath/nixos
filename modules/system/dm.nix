{ lib, ... }:

{
  imports = [
    ./DM/gdm.nix
  ];
  
  gdm.enable = lib.mkDefault false;
}
