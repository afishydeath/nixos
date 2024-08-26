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
  vms.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;

  environment.variables = {
    FLAKE = "/home/syn/nixos";
  };

}
