# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system/default.nix
    ];

  nixos.enable = true;

  tui.enable = true;
  gaming.enable = true;
  gui.enable = true;
  vms.enable = true;
  plasma6.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.syn = {
    isNormalUser = true;
    description = "Syn";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };


}
