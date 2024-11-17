{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    java.enable = lib.mkEnableOption "Enable java development environment";
  };

  config = lib.mkIf config.java.enable {
    home.packages = with pkgs; [
      jdk
      kotlin

      #LSP
      java-language-server
      kotlin-language-server

      #formatter
      google-java-format
      ktfmt

      #linter
      checkstyle
      ktlint
    ];
  };
}
