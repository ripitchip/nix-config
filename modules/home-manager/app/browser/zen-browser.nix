{
  pkgs,
  pkgs-zen-browser,
  lib,
  config,
  ...
}:

{
  options = {
    zen-browser.enable = lib.mkEnableOption "enables zen-browser browser";
  };
  config = lib.mkIf config.zen-browser.enable {
    home.packages =
      [ pkgs-zen-browser.specific ]
      ++ (with pkgs; [
        glib-networking
        gnome.adwaita-icon-theme
        gtk4
        glib
      ]);
  };
}
