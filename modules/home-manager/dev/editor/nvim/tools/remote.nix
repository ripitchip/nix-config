{
  pkgs-unstable,
  lib,
  config,
  ...
}:
let
  toLua = str: ''
    lua << EOF
    ${str}
    EOF
  '';
in
{
  config = lib.mkIf (config.nvim.enable) {
    home.packages = with pkgs-unstable; [ devpod ];
    programs.neovim = {
      plugins =
        with pkgs-unstable.vimPlugins;
        [ nui-nvim ]
        ++ [
          {
            plugin = (
              pkgs-unstable.vimUtils.buildVimPlugin {
                name = "remote-nvim";
                src = pkgs-unstable.fetchFromGitHub {
                  owner = "amitds1997";
                  repo = "remote-nvim.nvim";
                  rev = "main";
                  sha256 = "8gKQ7DwubWKfoXY4HDvPeggV+kxhlpz3yBmG9+SZ8AI=";
                };
              }
            );

            config = toLua ''require("remote-nvim").setup()'';
          }
        ];
    };
  };
}
