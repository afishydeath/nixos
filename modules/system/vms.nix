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

    # allow unfree
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        # Add additional package names here
        "vmware-workstation"
      ];

  };

}
