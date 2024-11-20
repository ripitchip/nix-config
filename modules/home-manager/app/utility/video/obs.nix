{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    obs.enable = lib.mkEnableOption "enables obs";
  };

  config = lib.mkIf config.obs.enable { home.packages = with pkgs; [ obs ]; };
}
