{ ... }:
{
  imports = [
    ./lshw.nix
    ./selector.nix
    ./acpi.nix
    ./vagrant.nix
    ./steam-run.nix
    ./picom.nix
    ./cli-utils
    ./network
  ];
}
