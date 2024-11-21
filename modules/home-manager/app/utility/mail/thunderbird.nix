{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    thunderbird.enable = lib.mkEnableOption "enables thunderbird";
  };

  config = lib.mkIf config.thunderbird.enable { home.packages = with pkgs; [ thunderbird ]; };
}
