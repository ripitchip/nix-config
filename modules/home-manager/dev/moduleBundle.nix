{ ... }:
{
  imports = [
    ./terminal/moduleBundle.nix
    ./git/moduleBundle.nix
    ./editor
    ./languages
    ./utility
    ./shell
    ./framework
  ];
}
