{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    flutter.enable = lib.mkEnableOption "Enable flutter";
  };

  config = lib.mkIf config.flutter.enable { home.packages = with pkgs; [ flutter ]; };
}
