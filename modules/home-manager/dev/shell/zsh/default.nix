# home.nix
{ config, pkgs, ... }:

{
  imports = [
    ./oh-my-zsh.nix
    ./zsh-plugins.nix
  ];
}
