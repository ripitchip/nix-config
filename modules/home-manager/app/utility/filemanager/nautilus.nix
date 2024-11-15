{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nautilus.enable = lib.mkEnableOption "enables nautilus";
  };

  config = lib.mkIf config.nautilus.enable { home.packages = with pkgs-unstable; [ nautilus ]; };
}
