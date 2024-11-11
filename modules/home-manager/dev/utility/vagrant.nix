{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    vagrant.enable = lib.mkEnableOption "enables vagrant";
  };

  config = lib.mkIf config.vagrant.enable { home.packages = with pkgs; [ vagrant ]; };
}
