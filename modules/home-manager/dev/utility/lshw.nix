{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    lshw.enable = lib.mkEnableOption "enables lshw";
  };

  config = lib.mkIf config.lshw.enable {
    home.packages = with pkgs; [
      lshw
      glxinfo
    ];
  };
}
