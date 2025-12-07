{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.qt6Packages.qt6ct ];
    sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
