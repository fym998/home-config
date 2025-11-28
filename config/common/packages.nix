{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      gh

      nil
      nixfmt
      ;
  };
}
