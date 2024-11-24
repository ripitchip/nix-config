{ config, ... }:

{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  # Import additional modules
  imports = [
    ./app
    ./local/moduleBundle.nix
    ./hardware
    ./dev/moduleBundle.nix
  ];

  home.sessionVariables = {
    # Uncomment and set your default editor
    EDITOR = "nvim";
    # Set XDG_DATA_HOME
    XDG_DATA_HOME = "/home/thomas/.local/share";
    XDG_CONFIG_HOME = "/home/thomas/.config";
  };

  # Enable various applications and utilities
  st.enable = true;
  nvim.enable = true;
  kubectl.enable = true;
  xdg.userDirs = {
    enable = true;
    desktop = "$HOME/desktop";
    download = "$HOME/downloads";
    templates = "$HOME/templates";
    documents = "$HOME/documents";
    music = "$HOME/music";
    pictures = "$HOME/images";
    videos = "$HOME/videos";
  };
  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Set Home Manager state version
  home.stateVersion = "24.05"; # Update this with caution when upgrading Home Manager.
}
