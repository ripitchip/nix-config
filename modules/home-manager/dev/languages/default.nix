{ ... }:
{
  imports = [
    ./python.nix
    ./lua.nix
    ./nix.nix
    ./latex.nix
    ./cpp.nix
    ./node.nix
    ./rust.nix
    ./csharp.nix

    ./selector.nix
  ];
}