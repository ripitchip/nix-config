{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    lsd.enable = lib.mkEnableOption "enables lsd";
  };

  config = lib.mkIf config.lsd.enable { home.packages = with pkgs; [ lsd ]; };
}
