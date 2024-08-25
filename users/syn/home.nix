{ config, pkgs, ... }:

{
  home.username = "syn";
  home.homeDirectory = "/home/syn";

  home.sessionVariables = {
    EDITOR = "nvim";
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


}
