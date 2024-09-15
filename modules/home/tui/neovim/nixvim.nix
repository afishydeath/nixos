{ lib, inputs, config, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/plugins.nix
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "enable nixvim";
  };


  config = lib.mkIf config.nixvim.enable {
    plugins.enable = lib.mkDefault true;

    programs.nixvim = {
      enable = true;

      # performance = {
      #   combinePlugins = {
      #     enable = true;
      #     standalonePlugins = [
      #       "hmts.nvim"
      #       "nvim-treesitter"
      #     ];
      #   };
      #   byteCompileLua = true;
      # };
      
      luaLoader.enable = true;

    };
  };

}