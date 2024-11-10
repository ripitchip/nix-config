{ pkgs, lib, config,... }:

{
  options = { gimp.enable = lib.mkEnableOption "enables gimp editor"; };
  config = lib.mkIf config.gimp.enable {
    home.packages = with pkgs; [
    	gimp
    ];
  };
}
