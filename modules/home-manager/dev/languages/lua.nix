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
    home.packages =
      with pkgs;
      [
        lua
        stylua
      ]
      ++ (with pkgs.luajitPackages; [
        lua-lsp
        luasnip
        jsregexp
      ]);
  };
}
