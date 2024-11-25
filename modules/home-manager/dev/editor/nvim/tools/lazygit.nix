{
  pkgs-unstable,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf (config.nvim.enable && config.lazygit.enable) {
    programs.neovim = {
      plugins = with pkgs-unstable.vimPlugins; [ lazygit-nvim ];
    };
  };
}
