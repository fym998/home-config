umu-launcher-wrapper:
{ localLib, ... }:
{
  imports = map (f: import f umu-launcher-wrapper) (localLib.lsSubmodule ./.);
}
