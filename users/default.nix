{ userSettings, ... }:

{
  imports = [
    ./${userSettings.username}/home.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = userSettings.username;
    homeDirecroty = "/home/${userSettings.username}";
    stateVersion = "24.05";
  };
}
