{ ... }:
{
  imports = [
    ./packettracer.nix
    ./wireshark.nix
  ];
  packettracer.enable = true;
  wireshark.enable = true;
}
