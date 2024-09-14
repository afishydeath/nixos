# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

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
  
  sddm.enable = true;
  plasma6.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.syn = {
    isNormalUser = true;
    description = "Syn";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };


}
