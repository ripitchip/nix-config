{ pkgs, lib, config,... }:

{
  options = { feh.enable = lib.mkEnableOption "enables feh image previewer"; };
  config = lib.mkIf config.feh.enable {
    home.packages = with pkgs; [
    	feh
    ];
  };
}
