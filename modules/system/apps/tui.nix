{ pkgs, lib, config, ... }:

{
  options = {
    tui.enable = lib.mkEnableOption "enables tui apps";
  };
  
  config = lib.mkIf config.tui.enable {
    environment.systemPackages = with pkgs; [
      bat
      home-manager
      vim
      lunarvim
      git
      lazygit
      eza
      thefuck
      starship
      bottom
      ghc
      haskell-language-server
      gnumake
    ];

    programs.zsh = {
      enable = true;
    };

    programs.ssh.startAgent = true;

    programs.nh = {
      enable = true;
      flake = "/home/syn/nixos";
    };
  };

}