{ lib, ... }:

{
  imports = [
    ./DM/gdm.nix
    ./DM/sddm.nix
    ./DM/lightdm.nix
  ];
  
  gdm.enable = lib.mkDefault false;
  sddm.enable = lib.mkDefault false;
  lightdm.enable = lib.mkDefault false;
}
