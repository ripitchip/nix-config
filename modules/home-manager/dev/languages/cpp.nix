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
      gcc-unwrapped
      libgcc
      clang-tools
    ];
  };
}
