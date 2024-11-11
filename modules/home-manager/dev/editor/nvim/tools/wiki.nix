{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.wiki.enable = lib.mkEnableOption "enables wiki in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.wiki.enable) {

    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [ vimwiki ];
      extraLuaConfig = ''
        ${builtins.readFile ./wiki.lua}
      '';
    };
  };
}
