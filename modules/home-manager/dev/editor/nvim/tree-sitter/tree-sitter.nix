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

    home.packages = with pkgs; [ tree-sitter ];
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
                # Programming Languages
                p.tree-sitter-arduino
                p.tree-sitter-bash
                p.tree-sitter-c
                p.tree-sitter-cpp
                p.tree-sitter-c_sharp
                p.tree-sitter-cmake
                p.tree-sitter-dart
                p.tree-sitter-go
                p.tree-sitter-java
                p.tree-sitter-javascript
                p.tree-sitter-lua
                p.tree-sitter-python
                p.tree-sitter-ruby
                p.tree-sitter-rust
                p.tree-sitter-typescript

                # Markup and Styling Languages
                p.tree-sitter-html
                p.tree-sitter-css
                p.tree-sitter-markdown
                p.tree-sitter-markdown-inline
                p.tree-sitter-latex
                p.tree-sitter-scss
                p.tree-sitter-toml
                p.tree-sitter-xml
                p.tree-sitter-yaml
                p.tree-sitter-vue

                # Version Control and Configurations
                p.tree-sitter-git_config
                p.tree-sitter-gitcommit
                p.tree-sitter-gitignore
                p.tree-sitter-gitattributes
                p.tree-sitter-editorconfig
                p.tree-sitter-dockerfile
                p.tree-sitter-helm

                # Miscellaneous
                p.tree-sitter-astro
                p.tree-sitter-bibtex
                p.tree-sitter-desktop
                p.tree-sitter-mermaid
                p.tree-sitter-nix
                p.tree-sitter-proto
                p.tree-sitter-powershell
                p.tree-sitter-vim
                p.tree-sitter-vimdoc
                p.tree-sitter-json
                p.tree-sitter-jsonc
                p.tree-sitter-sql
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
