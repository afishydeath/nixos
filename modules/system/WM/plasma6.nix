{ pkgs, lib, config, ... }:

{
  options = {
    plasma6.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.plasma6.enable {
    services.xserver = {
      enable = true;
      desktopManager.plasma6.enable = true;
    };

    # setup pam for kwallet
    security.pam.services.login.enableKwallet = true;

    environment.systemPackages = with pkgs; [
      kwallet-pam
    ];

  };
}
