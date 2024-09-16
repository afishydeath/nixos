{ config, lib, ... }:

{
  options = {
    home.tui.dev.git.enable = lib.mkEnableOption "git config enable";
  };

  config = lib.mkIf config.home.tui.dev.git.enable {
    programs.git = {
      enable = true;
      userName = "syn";
      userEmail = "afishydeath@gmail.com";
    };
  };
}
