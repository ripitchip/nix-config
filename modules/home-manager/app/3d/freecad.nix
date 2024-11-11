{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    freecad.enable = lib.mkEnableOption "enables freecad";
  };
  config = lib.mkIf config.freecad.enable { home.packages = with pkgs; [ freecad ]; };
}
