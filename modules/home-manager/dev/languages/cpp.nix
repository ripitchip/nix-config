{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    cpp.enable = lib.mkEnableOption "enable cpp";
  };

  config = lib.mkIf config.cpp.enable {
    home.packages = with pkgs; [
      gcc14
      clang-tools
    ];
  };
}
