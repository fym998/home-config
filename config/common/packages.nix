{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      gh

      nil
      nixfmt
      nix-tree

      tree

      htop
      btop

      lesspass-cli
      ;
  };
}
