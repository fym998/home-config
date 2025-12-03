{
  writeShellScriptBin,
  umu-launcher,
  lib,
  protonPath,
  enableWayland ? true,
}:
writeShellScriptBin "umu-run" ''
  if [ -z "$PROTONPATH" ]; then
      export PROTONPATH="${protonPath}"
  fi
  ${lib.optionalString enableWayland "export PROTON_ENABLE_WAYLAND=1"}
  exec ${lib.getExe umu-launcher} "$@"
''
