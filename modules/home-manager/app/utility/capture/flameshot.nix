{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    flameshot.enable = lib.mkEnableOption "enables flameshot";
  };

  config = lib.mkIf config.flameshot.enable { home.packages = with pkgs; [ flameshot ]; };
}
