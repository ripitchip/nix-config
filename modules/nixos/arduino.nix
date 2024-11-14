# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  # System packages for development
  environment.systemPackages = with pkgs; [
    platformio
    arduino-cli
    avrdude
    openocd
  ];

  # udev rules for microcontroller boards (e.g., Arduino, ESP32)
  services.udev.packages = [
    pkgs.platformio-core
    pkgs.openocd
  ];

  services.udev.extraRules = ''
    # Arduino boards (e.g., Uno, Mega, Nano)
    SUBSYSTEM=="usb", ATTR{idVendor}=="2341", MODE="0666"
    # CH340 Serial Converter (common for ESP32 boards)
    SUBSYSTEM=="usb", ATTR{idVendor}=="1a86", MODE="0666"
    # FTDI devices
    SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0666"
  '';
}
