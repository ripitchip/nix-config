{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./selector.nix
    ./telescope/telescope.nix
    ./harpoon/harpoon.nix
    ./lsp/lsp.nix
    ./format/format.nix
    ./tree-sitter/tree-sitter.nix

    # Must stay at the very bottom
    ./nvim.nix
  ];
}
