{
  pkgs,
  lib,
  config,
  ...
}:
{

  imports = [
    ./WM/moduleBundle.nix
    ./terminals/moduleBundle.nix
    ./hardware/moduleBundle.nix
    ./arduino.nix
  ];
}
