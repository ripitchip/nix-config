{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.latex.enable = lib.mkEnableOption "enables latex in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.latex.enable) {

    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [ vimtex ];
    };
    extraLuaConfig = ''
      ${builtins.readFile ./nvim-config/latex.lua}
    '';
  };
}
