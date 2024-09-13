{ pkgs, lib, config, ... }:

{
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
    ];
    
    programs.firefox.enable = true;

    # allow unfree
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        # Add additional package names here
        "obsidian"
      ];
  };

}
