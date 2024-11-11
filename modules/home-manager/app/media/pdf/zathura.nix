{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    zathura.enable = lib.mkEnableOption "Enable zathura service";
  };

  config = lib.mkIf config.zathura.enable {
    home.packages = with pkgs; [
      zathura
      xdotool
    ];
  };
}
