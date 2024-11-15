{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    packettracer.enable = lib.mkEnableOption "enables packettracer browser";
  };
  config = lib.mkIf config.packettracer.enable { home.packages = with pkgs; [ ciscoPacketTracer8 ]; };
}
