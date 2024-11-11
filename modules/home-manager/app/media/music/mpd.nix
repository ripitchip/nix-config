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
      musicDirectory = "~/music/";
      extraConfig = ''
        audio_output {
          type            "pipewire"
          name            "PipeWire Sound Server"
        }

      '';
    };
    environment.systemPackages = with pkgs; [
      mpc-cli
      ncmpcpp
    ];
  };
}
