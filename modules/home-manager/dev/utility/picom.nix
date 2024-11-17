{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    picom.enable = lib.mkEnableOption "Enable picom service";
  };

  config = lib.mkIf config.picom.enable {
    home.packages = with pkgs; [ picom ];

    services.picom = {
      enable = true;
      settings = {
        # Backend configuration
        backend = "glx";

        # Opacity settings
        active-opacity = 0.9;
        inactive-opacity = 0.85;

        # Blur settings
        blur-background = true;
        blur-method = "dual_kawase";
        blur-strength = 6;

        # Fading settings
        fading = true;
        fade-delta = 1;

        # Rounded corners configuration
        corner-radius = 6;
        rounded-corners-exclude = [ "class_g = 'dwm'" ];
      };
    };
  };
}
