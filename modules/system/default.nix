{ lib, ... } :
{
  imports = [
    ./tui.nix
    ./gui.nix
    ./vms.nix
    ./gaming.nix
  ];
  
  tui.enable = lib.mkDefault true;
  gui.enable = lib.mkDefault true;
  vms.enable = lib.mkdefault true;
  gaming.enable = lib.mkdefault true;

}
