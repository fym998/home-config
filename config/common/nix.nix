{ inputs, ... }:
{
  nix.registry = builtins.mapAttrs (_: input: { flake = input.sourceInfo; }) inputs;
}
