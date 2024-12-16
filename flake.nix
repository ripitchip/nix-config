{
  description = "Thomas Derudder Flakes";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixpkgs-zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dream2nix.url = "github:nix-community/dream2nix";
    dream2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-zen-browser,
      home-manager,
      android-nixpkgs,
      dream2nix,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-zen-browser = nixpkgs-zen-browser.packages."x86_64-linux";
    in
    {
      nixosConfigurations = {
        kashyyyk = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
          specialArgs = {
            inherit pkgs-unstable;
            inherit dream2nix;
          };
        };
      };
      homeConfigurations = {
        thomas = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./modules/home-manager/home.nix ];
          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit pkgs-zen-browser;
            inherit dream2nix;
          };
        };
      };
    };
}
