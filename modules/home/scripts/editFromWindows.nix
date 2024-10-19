{pkgs}:
pkgs.writeShellScriptBin "editFromWindows" ''
  wslpath "$1" | sed 's/ /\\ /g' | xargs nvim
''
