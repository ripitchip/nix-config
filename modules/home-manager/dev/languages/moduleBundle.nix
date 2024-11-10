{ pkgs, lib, config, ... }: {
  imports = [
	./python.nix
	./lua.nix
    ./nix.nix
    ./selector.nix
  ];
}
