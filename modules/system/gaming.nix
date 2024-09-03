{ pkgs, lib, config, ... }:

{
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming apps";
  };

  config = lib.mkIf config.gaming.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "\${HOME}/.steam/root/compatibilitytools.d";
    };
    services.xserver.videoDrivers = [ "ati" ];
  };
}
