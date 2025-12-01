{
  writeShellScriptBin,
  umu-launcher,
  lib,
  protonPath ? "$HOME/.steam/steam/compatibilitytools.d/GE-Proton10-25",
  enableWayland ? true,
}:
writeShellScriptBin "umu-run" ''
  if [ -z "$PROTONPATH" ]; then
      export PROTONPATH="${protonPath}"
  fi
  ${lib.optionalString enableWayland "export PROTON_ENABLE_WAYLAND=1"}
  ${lib.getExe umu-launcher} "$@"
''
