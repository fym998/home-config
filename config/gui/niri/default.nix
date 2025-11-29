{
  pkgs,
  localLib,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri-flake.homeModules.config
  ]
  ++ localLib.lsSubmodule ./settings;

  programs.niri.package = pkgs.niri;
}
