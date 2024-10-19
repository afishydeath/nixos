{pkgs, ...}: let
  editFromWindows = import ./editFromWindows.nix {inherit pkgs;};
in {
  home.packages = [
    editFromWindows
  ];
}
