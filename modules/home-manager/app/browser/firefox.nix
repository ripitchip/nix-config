{ pkgs, lib, config,... }:

{
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox browser";
  };
  config = lib.mkIf config.firefox.enable {
    home.packages = with pkgs; [
    	firefox
    ];
  };
}
