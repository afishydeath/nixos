{ lib, config, ... }:

{
  imports = [
    ./tui/git.nix
    ./tui/zsh.nix
  ];

  options = {
    tui.enable = lib.mkEnableOption "tui config enable";
  };

  config = lib.mkIf config.tui.enable {

    home.sessionVariables = {
      EDITOR = "v";
    };

    git.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;


    # too small for their own file
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

  };

}
