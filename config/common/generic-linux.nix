{
  pkgs,
  lib,
  config,
  ...
}:
{
  targets.genericLinux.enable = true;
  lib.genericLinux = {
    wrapIfEnabled =
      pkg: cmd:
      if !config.targets.genericLinux.enable then
        pkg
      else
        pkgs.writeShellScriptBin "${builtins.head (lib.splitString " " cmd)}-nix-wrapper" ''
          exec /usr/bin/${cmd} "$@"
        '';
    nullIfEnable = pkg: if !config.targets.genericLinux.enable then pkg else null;
    getCmd =
      pkg: cmd: if !config.targets.genericLinux.enable then "${pkg}/bin/${cmd}" else "/usr/bin/${cmd}";
  };
}
