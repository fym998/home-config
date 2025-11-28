{
  inputs,
  config,
  pkgs,
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
    package = pkgs.writeShellScriptBin "noctalia-shell" "exec qs -c noctalia-shell";
    systemd.enable = true;
    settings = localLib.mkSymlinkToSourcePath ./settings.json;
  };
  systemd.user.services.noctalia-shell =
    let
      cfg = config.programs.noctalia-shell;
    in
    lib.mkIf cfg.systemd.enable {
      # Install.WantedBy = lib.mkForce [ "niri.service" ];
    };
}
