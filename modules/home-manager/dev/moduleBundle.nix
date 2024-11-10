{ pkgs, lib, config, ... }: {
  imports = [
    ./terminal/moduleBundle.nix
    ./git/moduleBundle.nix
    ./editor/moduleBundle.nix
    ./languages/moduleBundle.nix
  ];
}