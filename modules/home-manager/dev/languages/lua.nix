{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    lua.enable = lib.mkEnableOption "enable lua";
  };

  config = lib.mkIf config.lua.enable {
    home.packages = with pkgs; [
      lua

      # lsp
      luajitPackages.lua-lsp
      luajitPackages.luasnip
      jsregexp # Needed with luasnip
      stylua
    ];
  };
}
