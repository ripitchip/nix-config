{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.lint.enable = lib.mkEnableOption "enables lint in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.lint.enable) {

    home.packages = with pkgs; [ ];

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
            plugin = nvim-lint;
            config = toLuaFile ./lint.lua;
          }
        ];
      };
  };
}
