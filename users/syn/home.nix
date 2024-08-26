{ ... }:

{
  
  imports = [
    ../../modules/home/default.nix
  ];

  home.username = "syn";
  home.homeDirectory = "/home/syn";
  home.sessionVariables.FLAKE = "/home/syn/nixos";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

}
