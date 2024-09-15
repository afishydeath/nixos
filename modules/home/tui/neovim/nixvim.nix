{ lib, inputs, config, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nixvim/plugins.nix
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  plugins.enable = lib.mkDefault config.nixvim.enable;

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;

      performance = {
        combinePlugins = {
          enable = true;
          standalonePlugins = [
            "hmts.nvim"
            "nvim-treesitter"
          ];
        };
        byteCompileLua = true;
      };
      
      luaLoader = true;

    };
  };

}
