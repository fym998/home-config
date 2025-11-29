{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.gnome-keyring = lib.mkIf (!config.targets.genericLinux.enable) {
    enable = true;
    components = [
      "pkcs11"
      "secrets"
      "ssh"
    ];
  };
  home.packages = [ pkgs.libsecret ];
}
