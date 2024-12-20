{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gui.enable = lib.mkEnableOption "enables gui apps";
  };

  config = lib.mkIf config.gui.enable {
    environment.systemPackages = with pkgs; [
      baobab
      signal-desktop
      obsidian
      sgt-puzzles
      vial
      vlc
      inkscape
      gparted
    ];
    programs.firefox.enable = true;
  };
}
