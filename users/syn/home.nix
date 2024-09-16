{ ... }:

{
  
  imports = [
    ../../modules/home/default.nix
  ];

  home.tui.enable = true;
  home.gui.enable = true;

}
