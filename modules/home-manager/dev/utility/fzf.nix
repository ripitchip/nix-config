{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
  };

  config = lib.mkIf config.fzf.enable { home.packages = with pkgs; [ fzf ]; };
}
