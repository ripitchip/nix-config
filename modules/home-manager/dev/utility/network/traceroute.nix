{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    traceroute.enable = lib.mkEnableOption "enables traceroute";
  };

  config = lib.mkIf config.traceroute.enable { home.packages = with pkgs; [ traceroute ]; };
}
