{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{

  options = {
    nvim.db.enable = lib.mkEnableOption "enables db in neovim";
  };
  config = lib.mkIf (config.nvim.enable && config.nvim.db.enable) {

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
          vim-dadbod
          vim-dadbod-ui
        ];
      };
  };
}
