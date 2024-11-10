{ pkgs, lib, config,... }:

{
  options = {
    signal.enable = lib.mkEnableOption "enables signal chat app";
  };
  config = lib.mkIf config.signal.enable {
    home.packages = with pkgs; [
      signal-desktop
    ];
  };
}
