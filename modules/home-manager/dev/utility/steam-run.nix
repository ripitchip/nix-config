{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    steam-run.enable = lib.mkEnableOption "enables steam-run";
  };

  config = lib.mkIf config.steam-run.enable { home.packages = with pkgs; [ steam-run ]; };
}
