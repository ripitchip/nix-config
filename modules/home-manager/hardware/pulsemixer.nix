{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    pulsemixer.enable = lib.mkEnableOption "enables pulsemixer to control sound";
  };
  config = lib.mkIf config.pulsemixer.enable { home.packages = with pkgs; [ pulsemixer ]; };
}
