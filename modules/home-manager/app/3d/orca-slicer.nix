{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    orca.enable = lib.mkEnableOption "enables orca slicer";
  };
  config = lib.mkIf config.orca.enable {
    home.packages = (
      with pkgs;
      [
        orca-slicer
        bambu-studio
      ]
    );
  };
}
