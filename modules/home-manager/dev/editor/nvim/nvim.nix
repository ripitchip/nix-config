{ pkgs, pkgs-unstable, lib, config, ... }: {

  options = { nvim.enable = lib.mkEnableOption "enables neovim"; };

  config = lib.mkIf config.nvim.enable {
    programs.neovim = let
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
    in {
      package = pkgs-unstable.neovim-unwrapped;
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server

        xclip
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = comment-nvim;
          config = toLua ''require("Comment").setup()'';
        }
        # {
        #   plugin = tokyonight-nvim;
        #   config = "colorscheme tokyonight-night";
        # }
        # transparent-nvim
        # catppuccin-vim
        # kanagawa-nvim
        # oxocarbon-nvim
        # neodev-nvim
        # {
        #   plugin = cloak-nvim;
        #   config = toLuaFile ./nvim-config/plugin/cloak.lua;
        # }
        # {
        #   plugin = nvim-autopairs;
        #   config = toLua ''require("nvim-autopairs").setup()'';
        # }
        #
        # lualine-nvim
        # nvim-web-devicons
        # vim-dadbod
        # vim-dadbod-ui
        # tailwindcss-colors-nvim
        # {
        #   plugin = copilot-vim;
        #   config = toLua "vim.g.copilot_enabled = 0";
        # }
        # {
        #   plugin = nvim-lint;
        #   config = toLuaFile ./nvim-config/plugin/lint.lua;
        # }
        #
        # vimtex
        #
        # {
        #   plugin = (nvim-treesitter.withPlugins (p: [
        #     p.tree-sitter-nix
        #     p.tree-sitter-vim
        #     p.tree-sitter-bash
        #     p.tree-sitter-markdown
        #     p.tree-sitter-vimdoc
        #     p.tree-sitter-lua
        #     p.tree-sitter-python
        #     p.tree-sitter-json
        #     p.tree-sitter-rust
        #     p.tree-sitter-markdown
        #   ]));
        #   config = toLuaFile ./nvim-config/plugin/treesitter.lua;
        # }
        #
        # vim-nix
        # lazygit-nvim
        # markdown-preview-nvim
        # trouble-nvim
        #
        # vim-visual-multi

      ];

      extraLuaConfig = ''
        ${builtins.readFile ./nvim-config/remap.lua}
        ${builtins.readFile ./nvim-config/set.lua}
      '';
    };
  };
}  
