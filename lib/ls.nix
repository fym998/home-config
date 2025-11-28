{ lib, ... }:
rec {
  lsWithCond =
    cond: path:
    lib.pipe path [
      builtins.readDir
      (lib.filterAttrs cond)
      builtins.attrNames
      (map (name: "${path}/${name}"))
    ];

  lsSubmoduleWithCond =
    cond:
    lsWithCond (
      n: t:
      cond n t && (lib.hasSuffix ".nix" n && t == "regular" && n != "default.nix") || t == "directory"
    );

  lsSubmodule = lsSubmoduleWithCond (_: _: true);
}
