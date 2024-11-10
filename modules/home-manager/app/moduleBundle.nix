{ pkgs, lib, config, ... }: {
  imports = [
    ./social/moduleBundle.nix
    ./browser/moduleBundle.nix
    ./media/moduleBundle.nix
  ];
}
