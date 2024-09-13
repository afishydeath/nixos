{ pkgs, lib, systemSettings, ... }:

{
  imports = [
    ./${systemSettings.hostname}/configuration.nix
  ];

  networking.hostname = "${systemSettings.hostname}";
  
  time.timeZone = "${systemSettings.timezone}";

}
