{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    home.gui.enable = lib.mkEnableOption "enable gui apps";
  };

  config = lib.mkIf config.home.gui.enable {
    programs.kitty.enable = true;
    home.packages = with pkgs; [
      qutebrowser
      wezterm
      clementine
      nicotine-plus
      gparted
    ];
  };
}
