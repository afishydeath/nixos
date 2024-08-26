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
    ];

    programs.zsh = {
      enable = true;
    };
    
  };

}
