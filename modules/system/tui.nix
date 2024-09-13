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
      nerdfonts
      nh
      git
      lazygit
      eza
      thefuck
      starship
      xclip
      wl-clipboard-rs
      bottom
      ghc
      haskell-language-server
    ];

    programs.zsh = {
      enable = true;
    };

    programs.ssh.startAgent = true;

    programs.nh.flake = /home/syn/nixos;
    
  };

}
