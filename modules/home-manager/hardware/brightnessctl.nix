{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    brightnessctl.enable = lib.mkEnableOption "enables brightness controll through brightnessctl";
  };
  config = lib.mkIf config.brightnessctl.enable { home.packages = with pkgs; [ brightnessctl ]; };
}
