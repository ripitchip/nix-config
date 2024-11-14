{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    markdown.enable = lib.mkEnableOption "Enable markdown development environment";
  };

  config = lib.mkIf config.markdown.enable {
    home.packages = with pkgs; [
      marksman

    ];
  };
}
