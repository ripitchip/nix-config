{ pkgs, ... }:

let
  fritzing = pkgs.appimageTools.wrapType2 {
    name = "fritzing";
    version = "1.0";
    src = ./fritzing.AppImage;

    meta = {
      description = "A popular open-source electronics design tool";
      homepage = "https://fritzing.org";
      platforms = pkgs.lib.platforms.linux;
    };
  };
in
{
  home.packages = [ fritzing ];
}
