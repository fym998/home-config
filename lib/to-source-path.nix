{
  pkgs,
  lib,
  hmLib,
  sourceRoot,
  ...
}:
rec {
  toSourcePath =
    path:
    builtins.replaceStrings [ (toString sourceRoot.inStore) ] [ (toString sourceRoot.source) ] (
      toString path
    );

  mkSymlinkToSourcePath =
    let
      mkOutOfStoreSymlink =
        path:
        let
          pathStr = toString path;
          name = hmLib.strings.storeFileName (baseNameOf pathStr);
        in
        pkgs.runCommandLocal name { } ''ln -s ${lib.escapeShellArg pathStr} $out'';
    in
    path: mkOutOfStoreSymlink (toSourcePath path);
}
