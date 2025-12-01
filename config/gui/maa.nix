{ pkgsFrom, ... }:
{
  home.packages = [ pkgsFrom.self.maa ];
}
