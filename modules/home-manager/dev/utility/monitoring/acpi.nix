{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    acpi.enable = lib.mkEnableOption "enables acpi";
  };

  config = lib.mkIf config.acpi.enable { home.packages = with pkgs; [ acpi ]; };
}
