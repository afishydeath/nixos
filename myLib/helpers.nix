# nix file containing general helper functions
rec {
  # recursively get all files in a directory
  filesIn = path: assert (builtins.isPath path); let
    type = builtins.readFileType path;
  in
    if type == "directory"
      then map (nextpath: filesIn ./${path}/${nextpath}) (builtins.attrNames (builtins.readDir path))
    else if type == "regular"
      then path
    else throw "Invalid input path.";

}
