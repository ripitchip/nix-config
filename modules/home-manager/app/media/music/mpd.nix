{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    mpd.enable = lib.mkEnableOption "Enable MPD service";
  };

  config = lib.mkIf config.mpd.enable {
    services.mpd = {
      enable = true;
      # Use `config.home.homeDirectory` for the user's home directory
      musicDirectory = "${config.home.homeDirectory}/music";
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
