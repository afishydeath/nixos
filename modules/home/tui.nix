{ lib, config, ... }:

{
  options = {
    tui.enable = lib.mkEnableOption "tui config enable";
  };

  config = lib.mkIf config.tui.enable {
    home.sessionVariables = {
      EDITOR = "v";
    };

    programs.git = {
      enable = true;
      userName = "syn";
      userEmail = "afishydeath@gmail.com";
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "exa -lh --icons";
        la = "ls -a";
        v = "lvim";
        gg = "lazygit";
        cd = "z";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "starship" ];
        theme = "starship";
      };
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

  };

}
