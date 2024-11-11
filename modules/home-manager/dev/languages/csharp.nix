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
    home.packages = with pkgs.dotnetCorePackages; [
      sdk_9_0
      csharpier
    ];
  };
}
