{ pkgs, pkgs-unstable, lib, config, ... }: {

  options = { nvim.lsp.enable = lib.mkEnableOption "enables lsp in neovim"; };
  config = lib.mkIf (config.nvim.enable && config.nvim.lsp.enable) {

    home.packages = with pkgs; [
    ];

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
      plugins = with pkgs-unstable.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./lsp.lua;
        }
        nvim-cmp
        cmp-nvim-lsp
        lsp-zero-nvim
        neodev-nvim
        {
          plugin = nvim-cmp;
          config = toLuaFile ./cmp.lua;
        }
        cmp_luasnip
        cmp-nvim-lsp
        cmp-nvim-lua
        cmp-path
        cmp-buffer
        luasnip
        friendly-snippets
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./keymap.lua}
      '';
    };
  };
}

