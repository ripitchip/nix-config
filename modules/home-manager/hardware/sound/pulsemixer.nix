{ pkgs, lib, config,... }:

{
  options = { sound-utils.enable = lib.mkEnableOption "enables sound packages like pulsemixer"; };
  config = lib.mkIf config.sound-utils.enable {
    home.packages = with pkgs; [
    	pulsemixer
    ];
  };
}
