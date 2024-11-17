{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    oha.enable = lib.mkEnableOption "enables oha";
  };

  config = lib.mkIf config.oha.enable { home.packages = with pkgs; [ oha ]; };
}
