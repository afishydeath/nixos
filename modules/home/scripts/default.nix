_: let
  editFromWindows = import ./editFromWindows.nix;
in {
  home.packages = [
    editFromWindows
  ];
}
