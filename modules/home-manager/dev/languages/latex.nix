{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    latex.enable = lib.mkEnableOption "enable latex";
  };

  config = lib.mkIf config.latex.enable { home.packages = with pkgs; [ texliveSmall ]; };
}
