{
  config,
  lib,
  pkgs,
  pkgsFrom,
  ...
}:
{
  services.swayidle =
    let
      qs = config.lib.genericLinux.wrapIfEnabled pkgsFrom.noctalia.default "qs";
      lockScreen = "${lib.getExe qs} -c noctalia-shell ipc call lockScreen lock";
      niri = config.lib.genericLinux.wrapIfEnabled config.programs.niri.package "niri";
      powerOffMonitors = "${lib.getExe niri} msg action power-off-monitors";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 900;
          command = lockScreen;
        }
        {
          timeout = 1200;
          command = powerOffMonitors;
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = lockScreen;
        }
      ];
    };
}
