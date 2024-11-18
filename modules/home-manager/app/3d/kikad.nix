{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    kicad.enable = lib.mkEnableOption "enables kicad";
  };
  config = lib.mkIf config.kicad.enable { home.packages = with pkgs; [ kicad ]; };
}
