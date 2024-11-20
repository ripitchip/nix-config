{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    python.enable = lib.mkEnableOption "enable python";
  };

  config = lib.mkIf config.python.enable {
    home.packages =
      (with pkgs; [
        python3

        # Formatter
        ruff
        black

        # Lsp
        python311Packages.python-lsp-server
        python311Packages.jedi-language-server
      ])
      ++ (with pkgs-unstable; [ hatch ]);
  };
}
