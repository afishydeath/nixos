{
  lib,
  userSettings,
  ...
}: {
  imports = [
    ./tui/tui.nix
    ./gui.nix
    ./scripts
  ];

  home = {
    tui.enable = lib.mkDefault false;
    gui.enable = lib.mkDefault false;
  };

  stylix = userSettings.stylixSettings;
  home.sessionVariables.EDITOR = "nvim";
}
