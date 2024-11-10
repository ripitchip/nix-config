{ pkgs, lib, config, ... }: {

  options = { pipewire.enable = lib.mkEnableOption "Enable PipeWire as the sound daemon."; };

  config = lib.mkIf config.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };
  };
}

