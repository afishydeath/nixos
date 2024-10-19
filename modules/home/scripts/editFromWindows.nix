{pkgs}:
pkgs.mkShellScriptBin "editFromWindows" ''
  wslpath "$1" | sed 's/ /\\ /g' | xargs nvim
''
