{ pkgs, lib, config, ... }:

{
  options = {
    vms.enable = lib.mkEnableOption "enables vms";
  };

  config = lib.mkIf config.vms.enable {

    environment.systemPackages = with pkgs; [
      vmware-workstation
    ];

    virtualisation.vmware.host.enable = true;

  };

}
