{ lib, ... }:

{
  imports = [
    ./apps/gui.nix
    ./apps/gaming.nix
    ./apps/tui.nix
    ./apps/vms.nix
  ];

  gui.enable = lib.mkDefault false;
  gaming.enable = lib.mkDefault false;
  tui.enable = lib.mkDefault false;
  vms.enable = lib.mkDefault false;

}
