{ ... }:
{
  imports = [
    ./lshw.nix
    ./selector.nix
    ./vagrant.nix
    ./steam-run.nix
    ./picom.nix
    ./cli-utils
    ./network
    ./monitoring
  ];
}
