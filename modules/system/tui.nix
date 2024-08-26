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
    ];

    programs.zsh = {
      enable = true;
    };
    
  };

}
