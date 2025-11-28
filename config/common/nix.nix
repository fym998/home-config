{ inputs, self, ... }:
{
  nix =
    let
      flakes = {
        home-config = self;
      }
      // builtins.removeAttrs inputs [ "self" ];
    in
    {
      registry = builtins.mapAttrs (_: flake: { inherit flake; }) flakes;
      channels = flakes;
    };
}
