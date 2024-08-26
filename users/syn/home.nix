{ config, pkgs, ... }:

{
  home.username = "syn";
  home.homeDirectory = "/home/syn";

  home.sessionVariables = {
    EDITOR = "v";
    FLAKE = "/home/syn/nixos";
  };

  home.file = {
    ".local/share/zsh/zsh-autosuggestions".source =
      "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    ".local/share/zsh/zsh-fast-syntax-highlighting".source =
      "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
    ".local/share/zsh/nix-zsh-completions".source =
      "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

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
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "starship" ];
      theme = "starship";
    };
  };

}
