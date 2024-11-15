{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
  };

  config = lib.mkIf config.yazi.enable { home.packages = with pkgs-unstable; [ yazi ]; };
}
