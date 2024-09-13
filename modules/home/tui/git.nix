{ pkgs, config, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "git config enable";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "syn";
      userEmail = "afishydeath@gmail.com";
      extraConfig = {
        credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };
  };
}
