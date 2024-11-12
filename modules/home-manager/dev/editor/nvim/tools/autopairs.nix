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
            plugin = nvim-autopairs;
            config = toLua ''require("nvim-autopairs").setup()'';
          }
        ];
        extraLuaConfig = '''';
      };
  };
}
