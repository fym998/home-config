args@{ lib, ... }:
let
  inherit (import ./ls.nix args) lsSubmodule;
in
lib.pipe ./. [
  lsSubmodule
  (map (m: import m args))
  (builtins.foldl' (l: r: l // r) { })
]
