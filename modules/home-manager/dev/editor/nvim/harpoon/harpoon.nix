{ pkgs, pkgs-unstable, lib, config, ... }: {

  options = { nvim.harpoon.enable = lib.mkEnableOption "enables harpoon in neovim"; };
  config = lib.mkIf (config.nvim.enable && config.nvim.harpoon.enable) {

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
        plenary-nvim
        harpoon2
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./keymap.lua}
      '';
    };
  };
}

