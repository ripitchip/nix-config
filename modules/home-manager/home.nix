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
  xdg = {
    userDirs = {
      enable = true;
      desktop = "$HOME/desktop";
      download = "$HOME/downloads";
      templates = "$HOME/templates";
      documents = "$HOME/documents";
      music = "$HOME/music";
      pictures = "$HOME/images";
      videos = "$HOME/videos";
    };
    mimeApps = {
      enable = false;
      #   defaultApplications = {
      #     "text/plain" = [ "nvim" ];
      #     "application/nix" = [ "nvim" ];
      #     "application/markdown" = [ "nvim" ];
      #     "application/pdf" = [ "zathura" ];
      #     "text/html" = [ "firefox" ];
      #     "x-scheme-handler/http" = [ "firefox" ];
      #     "x-scheme-handler/https" = [ "firefox" ];
      #     "x-scheme-handler/ftp" = [ "firefox" ];
      #     "x-scheme-handler/chrome" = [ "firefox" ];
      #     "x-scheme-handler/about" = [ "firefox" ];
      #     "x-scheme-handler/unknown" = [ "firefox" ];
      #     "application/x-extension-htm" = [ "firefox" ];
      #     "application/x-extension-html" = [ "firefox" ];
      #     "application/x-extension-shtml" = [ "firefox" ];
      #     "application/xhtml+xml" = [ "firefox" ];
      #     "application/x-extension-xhtml" = [ "firefox" ];
      #     "application/x-extension-xht" = [ "firefox" ];
      #   };
    };
  };
  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Set Home Manager state version
  home.stateVersion = "24.05"; # Update this with caution when upgrading Home Manager.
}
