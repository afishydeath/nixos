{ lib, ... }:

{
  imports = [
    ./DM/gdm.nix
    ./DM/sddm.nix
  ];
  
  gdm.enable = lib.mkDefault false;
  sddm.enable = lib.mkDefault false;
}
