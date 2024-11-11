{
  description = "Thomas Derudder Flakes";
  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        kashyyyk = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
          specialArgs = {
            inherit pkgs-unstable;
          };
        };
      };
      homeConfigurations = {
        thomas = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home-manager/home.nix ];
          extraSpecialArgs = {
            inherit pkgs-unstable;
          };
        };
      };
    };
}
