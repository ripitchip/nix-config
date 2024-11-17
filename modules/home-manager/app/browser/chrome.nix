{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    chrome.enable = lib.mkEnableOption "enables chrome browser";
  };
  config = lib.mkIf config.chrome.enable { home.packages = with pkgs; [ google-chrome ]; };
}
