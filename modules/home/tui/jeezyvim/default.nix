{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    home.tui.jeezyvim.enable = lib.mkEnableOption "enable jeezyvim";
  };
  config = lib.mkIf config.home.tui.jeezyvim.enable {
    home.packages = with pkgs; [
      (jeezyvim.nixvimExtend {
        config = {
          keymaps = [
            {
              mode = "n";
              action = "o";
              key = "o";
            }
            {
              mode = "n";
              action = "<cmd>w<CR>";
              key = "<leader>w";
            }
            {
              mode = "n";
              action = "<cmd>q<CR>";
              key = "<leader>q";
            }
          ];
        };
      })
    ];
  };
}
