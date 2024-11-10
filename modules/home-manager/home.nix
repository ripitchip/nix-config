{ config, pkgs, lib, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;


  # Import additional modules
  imports = [
    ./app/moduleBundle.nix
    ./local/moduleBundle.nix
    ./hardware/moduleBundle.nix
    ./dev/moduleBundle.nix
  ];

  # Session variables
  home.sessionVariables = {
    # Uncomment and set your default editor
    # EDITOR = "nvim";
  };

  # Enable various applications and utilities
  signal.enable = true;
  discord.enable = true;
  st.enable = true;
  firefox.enable = true;
  sound-utils.enable = true;
  nvim.enable = true;

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Set Home Manager state version
  home.stateVersion = "24.05"; # Update this with caution when upgrading Home Manager.
}

