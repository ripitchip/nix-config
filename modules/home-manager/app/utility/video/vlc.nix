{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    vlc.enable = lib.mkEnableOption "enables vlc";
  };

  config = lib.mkIf config.vlc.enable { home.packages = with pkgs; [ vlc ]; };
}
