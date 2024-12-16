{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    argocd.enable = lib.mkEnableOption "enables argocd";
  };

  config = lib.mkIf config.argocd.enable { home.packages = with pkgs; [ argocd ]; };
}
