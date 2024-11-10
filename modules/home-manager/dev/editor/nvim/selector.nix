{
  pkgs,
  lib,
  config,
  ...
}:
{
  nvim.telescope.enable = true;
  nvim.harpoon.enable = true;
  nvim.lsp.enable = true;
  nvim.format.enable = true;
  nvim.tree-sitter.enable = true;
}
