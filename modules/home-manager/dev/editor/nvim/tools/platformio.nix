{
  pkgs-unstable,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf (config.nvim.enable && config.lazygit.enable) {
    programs.neovim = {
      plugins = [
        (pkgs-unstable.vimUtils.buildVimPlugin {
          name = "nvim-platformio";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "anurag3301";
            repo = "nvim-platformio.lua";
            rev = "main";
            sha256 = "NMyuYoUC+WkXZH4d6ApOd4Kv8ppQd4/5VVhDb8e2hGs=";
          };
        })
      ];
    };
  };
}
