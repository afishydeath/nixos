{ lib, inputs, config, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;

      plugins.lightline.enable = true;
      plugins.which-key.enable = true;

      colorschemes.${inputs.theme}.enable = true;

    };
  };

}
