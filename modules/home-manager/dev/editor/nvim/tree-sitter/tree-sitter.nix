{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.tree-sitter.enable = lib.mkEnableOption "enables TS in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.tree-sitter.enable) {

    programs.neovim =
      let
        toLua = str: ''
          lua << EOF
          ${str}
          EOF
        '';
        toLuaFile = file: ''
          lua << EOF
          ${builtins.readFile file}
          EOF
        '';
      in
      {
        plugins = with pkgs-unstable.vimPlugins; [
          {
            plugin = (
              nvim-treesitter.withPlugins (p: [
                p.tree-sitter-nix
                p.tree-sitter-vim
                p.tree-sitter-bash
                p.tree-sitter-markdown
                p.tree-sitter-vimdoc
                p.tree-sitter-lua
                p.tree-sitter-python
                p.tree-sitter-json
                p.tree-sitter-rust
                p.tree-sitter-markdown
              ])
            );
            config = toLuaFile ./treesitter.lua;
          }

        ];
        extraLuaConfig = ''
          ${builtins.readFile ./keymap.lua}
        '';
      };
  };
}
