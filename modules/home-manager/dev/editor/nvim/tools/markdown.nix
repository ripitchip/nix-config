{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.autopairs.enable = lib.mkEnableOption "enables autopairs in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.autopairs.enable) {

    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [
        mini-nvim
        {
          plugin = render-markdown-nvim;
          config = toLua ''require('render-markdown').setup({})'';
        }
      ];
      extraLuaConfig = '''';
    };
  };
}
