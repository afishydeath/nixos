{ pkgs, lib, config, ... }:

{
  options = {
    plasma6.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.plasma6.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.plasma6.enable = true;
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "syn";
    # setup pam for kwallet
    security.pam.services.login.enableKwallet = true;

    environment.systemPackages = with pkgs; [
      kwallet-pam
    ];

  };
}
