{
  pkgs,
  lib,
  config,
  ...
}:
{

  home.packages = with pkgs; [
    # format
    nixfmt-rfc-style
    # lsp
    nil
    nix-prefetch-git
  ];
}
