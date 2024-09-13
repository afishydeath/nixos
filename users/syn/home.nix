{ ... }:

{
  
  imports = [
    ../../modules/home/default.nix
  ];

  home.username = "syn";
  home.homeDirectory = "/home/syn";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

}
