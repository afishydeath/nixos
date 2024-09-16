# nix file containing general helper functions
rec {
  # recursively get all files in a directory
  filesIn = path: assert (builtins.isPath path); let
    type = builtins.readFileType path;
    deNest = list: builtins.filter (item: !(builtins.isList item)) list ++ builtins.concatLists (builtins.filter builtins.isList list);
  in
    if (type == "directory")
    then deNest (map (next: filesIn (path+("/"+next))) (builtins.attrNames (builtins.readDir path)))
    else if type == "regular"
    then path
    else throw "Invalid input path.";

}
