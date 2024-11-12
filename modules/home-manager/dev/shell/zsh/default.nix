{ config, ... }:
{
  imports = [ ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    envExtra = "";

    shellAliases = { };
    history = {
      size = 10000;
      path = "${config.xdg.configHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      custom = "${config.xdg.configHome}/zsh/custom";
      plugins = [
        "git"
        "sudo"
        "zsh-autopair"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "you-should-use"
        "fzf-zsh-plugin"
        "fzf"
        "colorize"
        "command-not-found"
        "colored-man-pages"
        "cp"
        "docker"
        "emoji-clock"
        "emoji"
        "sudo"
        "zoxide"
        "navi"
        "zsh-lsd"
        "rust"
        "conda-zsh-completion"
        "tmuxinator"
      ];
      theme = "cat";
    };
  };
  home.file = {
    ".config/zsh/custom/themes" = {
      source = ./themes;
      recursive = true;
    };
    ".config/zsh/custom/plugins" = {
      source = ./plugins;
      recursive = true;
    };
  };
}
