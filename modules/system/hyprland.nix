{ pkgs, lib, config, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "enable window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    services.xserver = {
      enable = true;
    };
    programs.hyprland.enable = true;

    services.displayManager.sddm.enable = true;
    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "syn";

    environment.systemPackages = with pkgs; [
      kitty
    ];

  };
}
