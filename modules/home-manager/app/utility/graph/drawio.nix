{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    drawio.enable = lib.mkEnableOption "enables drawio";
  };

  config = lib.mkIf config.drawio.enable { home.packages = with pkgs; [ drawio ]; };
}
