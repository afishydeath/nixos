{
  config,
  lib,
  ...
}: {
  options = {
    home.tui.shell.zsh.enable = lib.mkEnableOption "zsh config enable";
  };

  config = lib.mkIf config.home.tui.shell.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "exa -lh --icons";
        la = "ls -a";
        v = "nvim";
        gg = "lazygit";
        cd = "z";
      };
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "thefuck" "starship" "direnv"];
        theme = "starship";
      };
    };
  };
}
