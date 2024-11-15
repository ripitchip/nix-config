{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    sqlite.enable = lib.mkEnableOption "Enable sqlite";
  };

  config = lib.mkIf config.sqlite.enable { home.packages = with pkgs; [ sqlite ]; };
}
