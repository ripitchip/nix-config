# /etc/nixos/configuration.nix
{ config, pkgs, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
