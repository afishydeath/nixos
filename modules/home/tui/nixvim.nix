{ lib, inputs, config, userSettings, pkgs, ... }:

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

      extraPlugins = with pkgs; [
        vimPlugins.${userSettings.theme}
      ];
      colorscheme = "${userSettings.theme}";
    };
  };

}
