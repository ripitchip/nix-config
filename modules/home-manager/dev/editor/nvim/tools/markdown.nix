{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.markdown.enable = lib.mkEnableOption "enables markdown in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.markdown.enable) {

    programs.neovim =
      let
        toLua = str: ''
          lua << EOF
          ${str}
          EOF
        '';
      in
      {
        plugins = with pkgs-unstable.vimPlugins; [
          mini-nvim
          {
            plugin = render-markdown-nvim;
            config = toLua ''require('render-markdown').setup({file_types = { 'markdown', 'vimwiki' },})'';
          }
        ];
        extraLuaConfig = ''vim.treesitter.language.register('markdown', 'vimwiki')'';
      };
  };
}
