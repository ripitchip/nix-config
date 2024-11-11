{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    csharp.enable = lib.mkEnableOption "enable csharp";
  };

  config = lib.mkIf config.csharp.enable {
    home.packages =
      with pkgs.dotnetCorePackages;
      combinePackages [
        sdk_8_0
        runtime_8_0
        aspnetcore_8_0
      ];
  };
}
