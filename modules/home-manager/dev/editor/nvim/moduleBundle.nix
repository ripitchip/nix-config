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
    ./lint/lint.nix
    ./tree-sitter/tree-sitter.nix
    ./cloak/cloak.nix
    ./db/db.nix
    ./tools/trouble.nix
    ./tools/selector.nix
    ./tools/latex.nix
    ./tools/wiki.nix
    ./tools/lazygit.nix
    ./tools/theme.nix
    ./tools/markdown.nix
    ./tools/autopairs.nix

    # Must stay at the very bottom
    ./nvim.nix
  ];
}
