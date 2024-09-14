{ config, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "git config enable";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "syn";
      userEmail = "afishydeath@gmail.com";
    };
  };
}
