{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.theme.enable = lib.mkEnableOption "enables theme selection in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.theme.enable) {

    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [ tokyonight-nvim ];
      extraLuaConfig = ''
        vim.cmd("colorscheme tokyonight-night")
      '';
    };
  };
}
