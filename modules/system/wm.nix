{ lib, ... }:

{
  imports = [
    ./WM/gnome.nix
    ./WM/plasma6.nix
    ./WM/hyprland.nix
  ];

  gnome.enable = lib.mkDefault false;
  plasma6.enable = lib.mkDefault false;
  hyprland.enable = lib.mkDefault false;

}
