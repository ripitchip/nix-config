{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    go.enable = lib.mkEnableOption "Enable go development environment";
  };

  config = lib.mkIf config.go.enable { home.packages = with pkgs; [ go ]; };
}
