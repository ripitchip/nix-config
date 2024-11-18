{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    localsend.enable = lib.mkEnableOption "enables localsend";
  };

  config = lib.mkIf config.localsend.enable { home.packages = with pkgs-unstable; [ localsend ]; };
}
