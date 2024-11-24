# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  programs.wireshark.enable = true;
}
