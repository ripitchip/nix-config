{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.selector.enable = lib.mkEnableOption "enables smart selection in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.selector.enable) {

    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [ vim-visual-multi ];
    };
  };
}
