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
      (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      })
      k9s
    ];
  };
}
