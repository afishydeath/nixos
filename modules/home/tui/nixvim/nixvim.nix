{ lib, inputs, config, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/plugins.nix
    ./config/config.nix
  ];

  options = {
    home.tui.nixvim.enable = lib.mkEnableOption "enable nixvim";
  };


  config = lib.mkIf config.home.tui.nixvim.enable {
    home.tui.nixvim = {
      plugins.enable = lib.mkDefault true;
      config.enable = lib.mkDefault true;
    };

    programs.nixvim = {
      enable = true;
    };
  };

}
