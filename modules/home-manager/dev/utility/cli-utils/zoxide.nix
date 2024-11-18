{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    zoxide.enable = lib.mkEnableOption "enables zoxide";
  };

  config = lib.mkIf config.zoxide.enable { home.packages = with pkgs; [ zoxide ]; };
}
