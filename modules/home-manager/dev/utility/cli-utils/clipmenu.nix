{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    clipmenu.enable = lib.mkEnableOption "enables clipmenu";
  };

  config = lib.mkIf config.clipmenu.enable {
    home.packages = with pkgs; [ clipmenu ];
    services.clipmenu.enable = true;
  };
}
