{
  lib,
  android-tools,
  callPackage,
  zenity,
  umu-launcher-wrapper,
  writeShellApplication,
  maaPath,
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
    # 如果 maa_path 未设置，则使用默认值
    if [ -z "$maa_path" ]; then
        maa_path="$HOME/Games/maa"
    fi
    maa_bin="$maa_path/MAA.exe"
    config_file="$maa_path/config/gui.json"

    echo "maa_path=$maa_path"
    echo "maa_bin=$maa_bin"
    echo "config_file=$config_file"

    maa_cmd="env GAMEID=maa ${lib.getExe umu-launcher-wrapper} $maa_bin"
    echo "maa_cmd=$maa_cmd"
    ${builtins.readFile ./maa.sh}
  '';
}
