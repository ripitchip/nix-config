{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    mpd.enable = lib.mkEnableOption "enables mpd";
  };

  config = lib.mkIf config.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/thomas/music/";
      extraConfig = ''
        audio_output {
          type            "pipewire"
          name            "PipeWire Sound Server"
        }

      '';
    };
    home.packages = with pkgs; [
      mpc-cli
      ncmpcpp
    ];
  };
}
