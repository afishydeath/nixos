{ systemSettings, hostname, lib, ... }:

{
  imports = [
    ./${hostname}/configuration.nix
  ];
  
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  
  time.timeZone = "${systemSettings.timezone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.utf8";

  i18n.extraLocaleSettings = {
    LC_ALL = "en_AU.utf8";
  };

  # allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "vmware-workstation"
      "steam"
      "steam-original"
      "steam-run"
      "obsidian"
      "broadcom-sta"
      "nvidia-x11"
      "nvidia-settings"
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
