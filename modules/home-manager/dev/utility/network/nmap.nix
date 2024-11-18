{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    nmap.enable = lib.mkEnableOption "enables nmap";
  };

  config = lib.mkIf config.nmap.enable { home.packages = with pkgs; [ nmap ]; };
}
