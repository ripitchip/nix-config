{ pkgs, lib, config,... }:

{
  options = {
    discord.enable = lib.mkEnableOption "enables discord chat app";
  };
  config = lib.mkIf config.signal.enable {
    home.packages = with pkgs; [
      discord
    ];
  };
}
