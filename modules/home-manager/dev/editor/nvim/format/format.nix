{ pkgs, pkgs-unstable, lib, config, ... }: {

  options = { nvim.format.enable = lib.mkEnableOption "enables format in neovim"; };
  config = lib.mkIf (config.nvim.enable && config.nvim.format.enable) {

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
          plugin = conform-nvim;
          config = toLuaFile ./format.lua;
        }
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./keymap.lua}
      '';
    };
  };
}

