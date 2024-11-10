{ pkgs, lib, config, ... }: {
  imports = [
    ./image/moduleBundle.nix
    ./selector.nix
    #./music/modulebundle.nix
    #./office/modulebundle.nix
    #./pdf/modulebundle.nix
  ];
}
