{ lib, config, ... }:

{
  options = {
    plugins.enable = lib.mkEnableOption "enable nixvim plugins";
  };
  config = lib.mkIf config.plugins.enable {
    programs.nixvim.plugins = {
      treesitter = {
        enable = true;

        nixvimInjections = true;

        indent = true;
        folding = true;
      };

      lsp-format.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
          rust_analyzer.enable = true;
        };
      };
    };
  };
}
