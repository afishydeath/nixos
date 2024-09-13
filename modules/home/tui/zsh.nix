{  config, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "zsh config enable";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
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

  };
}
