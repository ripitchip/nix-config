{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    hugo.enable = lib.mkEnableOption "enable hugo";
  };

  config = lib.mkIf config.hugo.enable { home.packages = with pkgs-unstable; [ hugo ]; };
}
