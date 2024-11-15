{
  pkgs-unstable,
  lib,
  config,
  ...
}:

{
  options = {
    openscad.enable = lib.mkEnableOption "enables openscad";
  };
  config = lib.mkIf config.openscad.enable {
    home.packages = with pkgs-unstable; [ openscad-unstable ];
  };
}
