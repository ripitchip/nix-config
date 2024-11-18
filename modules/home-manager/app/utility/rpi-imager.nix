{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    rpi.enable = lib.mkEnableOption "enables rpi";
  };

  config = lib.mkIf config.rpi.enable { home.packages = with pkgs; [ rpi-imager ]; };
}
