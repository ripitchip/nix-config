{ pkgs, lib, config, ... }: {
  imports = [
    ./feh.nix
    ./gimp.nix
    ./inkscape.nix
  ];
}
