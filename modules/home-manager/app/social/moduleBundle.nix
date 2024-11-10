{ pkgs, lib, config, ... }: {
  imports = [
    ./signal.nix
    ./discord.nix
  ];
}
