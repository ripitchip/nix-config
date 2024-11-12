# zsh-plugins.nix
{ pkgs, ... }:
let
  # Define each plugin using fetchgit
  fzfZshPlugin = pkgs.fetchgit {
    url = "https://github.com/unixorn/fzf-zsh-plugin.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshAutopair = pkgs.fetchgit {
    url = "https://github.com/hlissner/zsh-autopair.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshAutosuggestions = pkgs.fetchgit {
    url = "git@github.com:zsh-users/zsh-autosuggestions.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshCompletions = pkgs.fetchgit {
    url = "git@github.com:zsh-users/zsh-completions.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshLsd = pkgs.fetchgit {
    url = "git@github.com:wintermi/zsh-lsd.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshSyntaxHighlighting = pkgs.fetchgit {
    url = "git@github.com:zsh-users/zsh-syntax-highlighting.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  youShouldUse = pkgs.fetchgit {
    url = "git@github.com:MichaelAquilina/zsh-you-should-use.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  condaZshCompletion = pkgs.fetchgit {
    url = "git@github.com:conda-incubator/conda-zsh-completion.git";
    rev = "main";
    ref = "refs/heads/main";
  };

  zshAutocomplete = pkgs.fetchgit {
    url = "git@github.com:marlonrichert/zsh-autocomplete.git";
    rev = "main";
    ref = "refs/heads/main";
  };

in
{
  home.file = {
    ".config/zsh/custom/plugins/fzf-zsh-plugin" = {
      source = fzfZshPlugin;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-autopair" = {
      source = zshAutopair;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-autosuggestions" = {
      source = zshAutosuggestions;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-completions" = {
      source = zshCompletions;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-lsd" = {
      source = zshLsd;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-syntax-highlighting" = {
      source = zshSyntaxHighlighting;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/you-should-use" = {
      source = youShouldUse;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/conda-zsh-completion" = {
      source = condaZshCompletion;
      recursive = true;
      directory = true;
    };
    ".config/zsh/custom/plugins/zsh-autocomplete" = {
      source = zshAutocomplete;
      recursive = true;
      directory = true;
    };
  };
}
