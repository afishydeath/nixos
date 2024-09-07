{ lib, ... } :
{
  imports = [
    ./tui.nix
    ./gui.nix
    ./vms.nix
    ./gaming.nix
    ./plasma6.nix
    ./gnome.nix
  ];
  
  tui.enable = lib.mkDefault true;
  gui.enable = lib.mkDefault true;
  vms.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  plasma6.enable = lib.mkDefault true;
  gnome.enable = lib.mkDefault false;

}
