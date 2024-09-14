{ pkgs, lib, config, ... }:

{
  options = {
    gnome.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
    };

    # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.lock-keys
    ];

  };
}
