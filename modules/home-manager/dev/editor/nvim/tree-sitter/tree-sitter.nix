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
            plugin = nvim-treesitter.withAllGrammars;
            config = toLuaFile ./treesitter.lua;
          }

        ];
        extraLuaConfig = ''
          ${builtins.readFile ./keymap.lua}
        '';
      };
  };
}
