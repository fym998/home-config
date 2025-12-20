{
  inputs,
  config,
  pkgs,
  pkgsFrom,
  lib,
  localLib,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./niri.nix
  ];
  programs.noctalia-shell = {
    enable = true;
    package = config.lib.genericLinux.wrapIfEnabled pkgsFrom.noctalia.default "qs -c noctalia-shell";
    systemd.enable = true;
  };
  xdg.configFile = lib.mkIf config.programs.noctalia-shell.enable (
    lib.genAttrs' (localLib.lsFileRecursively ./config) (
      file:
      lib.nameValuePair "noctalia/${lib.removePrefix ((toString ./config) + "/") (toString file)}" {
        source = localLib.mkSymlinkToSource file;
      }
    )
  );
  home.packages = lib.mkIf config.programs.noctalia-shell.enable [
    pkgs.app2unit
  ];
}
