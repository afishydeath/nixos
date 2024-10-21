# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ../../modules/system/default.nix
  ];
  system.stateVersion = "24.05";
  wsl = {
    enable = true;
    defaultUser = "syn";
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  tui.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.syn = {
    isNormalUser = true;
    description = "Syn";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
}
