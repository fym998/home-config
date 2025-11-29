{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      gh

      nil
      nixfmt

      tree

      htop
      btop

      lesspass-cli
      ;
  };
}
