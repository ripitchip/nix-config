{ ... }:
{

  imports = [
    ./WM/moduleBundle.nix
    ./terminals/moduleBundle.nix
    ./hardware/moduleBundle.nix
    ./arduino.nix
    ./games/steam.nix
  ];
}
