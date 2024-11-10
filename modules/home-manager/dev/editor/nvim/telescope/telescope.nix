{ pkgs, pkgs-unstable, lib, config, ... }: {

  options = { nvim.telescope.enable = lib.mkEnableOption "enables telescope in neovim"; };
  config = lib.mkIf (config.nvim.enable && config.nvim.telescope.enable) {

    home.packages = with pkgs; [
      ripgrep
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
          plugin = telescope-nvim;
          config = toLuaFile ./telescope.lua;
        }
        telescope-undo-nvim
        telescope-fzf-native-nvim
        vim-bookmarks
        telescope-vim-bookmarks-nvim
        telescope-coc-nvim
        telescope-file-browser-nvim
        telescope-project-nvim
        telescope-media-files-nvim
        telescope_hoogle
        telescope-live-grep-args-nvim
        harpoon2
        trouble-nvim
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./keymap.lua}
      '';
    };
  };
}

