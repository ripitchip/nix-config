{ pkgs, config, ... }:
{
  # Accept Android SDK licenses
  # Home-manager configuration
  home = {
    packages = with pkgs; [
      android-studio # Android Studio
      androidenv.androidPkgs_9_0.androidsdk # Android SDK for API 28
      udev # Device rules
    ];
  };
}
