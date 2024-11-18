{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    kubectl.enable = lib.mkEnableOption "enable kube tools";
  };

  config = lib.mkIf config.kubectl.enable {
    home.packages = with pkgs-unstable; [
      kubectl
      helm
      k9s
    ];
  };
}
