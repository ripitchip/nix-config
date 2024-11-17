{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    latex.enable = lib.mkEnableOption "enable latex";
  };

  config = lib.mkIf config.latex.enable {
    home.packages = with pkgs; [
      texliveFull
      # Formatter
      texlivePackages.latexindent
      texlivePackages.lacheck
      texlab
      texlivePackages.chktex
      # Color for minted
      python311Packages.pylatexenc
      python311Packages.pygments
    ];
  };
}
