{ pkgs, lib, config,... }:

{
  options = { inkscape.enable = lib.mkEnableOption "enables inkscape editor"; };
  config = lib.mkIf config.inkscape.enable {
    home.packages = with pkgs; [
    	inkscape
    ];
  };
}
