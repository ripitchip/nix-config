{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    arduino.enable = lib.mkEnableOption "Enable Arduino and PlatformIO development environment";
  };

  config = lib.mkIf config.arduino.enable {
    home.packages = with pkgs; [
      arduino-cli
      platformio
      avrdude
    ];
  };
}
