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

    # Must stay at the very bottom
    ./nvim.nix
  ];
}
