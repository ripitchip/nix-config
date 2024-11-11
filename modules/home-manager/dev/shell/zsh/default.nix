{ config, ... }:
{
  imports = [ ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    envExtra = "";

    shellAliases = { };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # Read the zsh prompt script from a file
    initExtra = ''
      ${builtins.readFile ./theme/cat.zsh-theme}
    '';
  };
}
