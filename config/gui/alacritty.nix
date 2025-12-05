{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    package = config.lib.genericLinux.nullIfEnable pkgs.alacritty;
    settings = {
      window = {
        decorations = "None";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };
}
