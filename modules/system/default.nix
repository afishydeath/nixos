{ lib, ... } :
{
  imports = [
    ./tui.nix
    ./gui.nix
    ./vms.nix
    ./gaming.nix
    ./dm.nix
  ];
  
  tui.enable = lib.mkDefault true;
  gui.enable = lib.mkDefault true;
  vms.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  dm.enable = lib.mkDefault true;

}
