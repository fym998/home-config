{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.umu =
    let
      inherit (lib) mkOption types;
    in
    {
      package = mkOption {
        type = types.package;
        default = config.lib.genericLinux.wrapIfEnabled pkgs.umu-launcher "umu-run";
      };
      eval.wrapper = mkOption {
        type = types.package;
        readOnly = true;
      };
      protonPath = mkOption {
        type = types.either types.str types.path;
      };
      enableWayland = mkOption {
        type = types.bool;
        default = true;
      };
    };
  config =
    let
      cfg = config.umu;
    in
    {
      umu = {
        protonPath = "$HOME/.steam/steam/compatibilitytools.d/GE-Proton10-25";
        eval.wrapper = pkgs.callPackage ./umu-launcher-wrapper.nix {
          umu-launcher = cfg.package;
          inherit (cfg) protonPath enableWayland;
        };
      };
      home.packages = [ cfg.eval.wrapper ];
    };
  imports = [
    (import ./apps config.umu.eval.wrapper)
  ];
}
