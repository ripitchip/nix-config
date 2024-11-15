{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    wireshark.enable = lib.mkEnableOption "enables wireshark browser";
  };
  config = lib.mkIf config.wireshark.enable { home.packages = with pkgs; [ wireshark ]; };
}
