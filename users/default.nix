{ userSettings, ... }:

{
  imports = [
    ./${userSettings.username}/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = userSettings.username;
    homeDirectory = "/home/${userSettings.username}";
    stateVersion = "24.05";
  };
}
