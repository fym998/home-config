{
  android-tools,
  callPackage,
  zenity,
  umu-launcher-wrapper ? callPackage ../umu-launcher-wrapper.nix { },
  writeShellApplication,
  maaPath ? "$HOME/Games/maa",
}:
writeShellApplication {
  name = "maa";
  runtimeInputs = [
    android-tools
    zenity
    umu-launcher-wrapper
  ];
  excludeShellChecks = [ "SC2181" ];
  bashOptions = [
    "nounset"
    "pipefail"
  ];
  text = ''
    maa_path="${maaPath}"
    ${builtins.readFile ./maa.sh}
  '';
}
