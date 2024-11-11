{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    node.enable = lib.mkEnableOption "enable node";
  };

  config = lib.mkIf config.node.enable { home.packages = with pkgs; [ nodejs_22 ]; };
}
