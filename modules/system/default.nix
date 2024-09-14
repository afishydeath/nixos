{ lib, userSettings, ... } :
{
  imports = [
    ./apps.nix

    ./dm.nix
    ./wm.nix
    
    ./nixos.nix
  ];

  nixos.enable = lib.mkDefault false;

  stylix = userSettings.stylixSettings;

}
