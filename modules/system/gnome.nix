{ pkgs, lib, config, ... }:

{
  options = {
    gnome.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "syn";

    environment.systemPackages = with pkgs; [
      gnomeExtensions.lock-keys
    ];

  };
}
