{ lib, userSettings, ... } :
{
  imports = [
    ./tui.nix
    ./gui.nix
    ./vms.nix
    ./gaming.nix
    ./plasma6.nix
    ./gnome.nix
    ./hyprland.nix
    ./nixos.nix
  ];
  
  tui.enable = lib.mkDefault false;
  gui.enable = lib.mkDefault false;
  vms.enable = lib.mkDefault false;
  gaming.enable = lib.mkDefault false;
  plasma6.enable = lib.mkDefault false;
  gnome.enable = lib.mkDefault false;
  hyprland.enable = lib.mkDefault false;
  nixos.enable = lib.mkDefault false;

  stylix = userSettings.stylixSettings;
}
