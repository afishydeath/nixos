{
  pkgs,
  lib,
  config,
  ...
}: {
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
      gnumake
      mdr
      xsel
      wl-clipboard-rs
      ripgrep
      fd
      exfat
    ];

    programs = {
      zsh.enable = true;
      ssh.startAgent = true;
      nh = {
        enable = true;
        flake = "/home/syn/nixos/";
      };
    };
  };
}
