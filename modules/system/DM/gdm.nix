{ lib, config, userSettings, ... }:

{
  options = {
    gdm.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "${userSettings.username}";

  };
}
