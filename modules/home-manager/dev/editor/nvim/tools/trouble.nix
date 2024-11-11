{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    nvim.trouble.enable = lib.mkEnableOption "Enables Trouble.nvim in Neovim";
  };

  config = lib.mkIf (config.nvim.enable && config.nvim.trouble.enable) {
    programs.neovim =
      let
        toLua = str: ''
          lua << EOF
          ${str}
          EOF
        '';
      in
      {
        plugins = with pkgs-unstable.vimPlugins; [ trouble-nvim ];

        extraLuaConfig = ''
          -- Lazy-load Trouble.nvim with the :Trouble command
          vim.api.nvim_create_autocmd("CmdUndefined", {
            pattern = "Trouble",
            callback = function()
              vim.cmd("packadd trouble-nvim")
              require("trouble").setup({
                auto_open = false,
                auto_close = false,
                use_diagnostic_signs = true,
              })
            end,
          })

          -- Updated key mappings for Trouble.nvim
          vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
          vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
          vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
          vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / References (Trouble)" })
          vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
          vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
        '';
      };
  };
}
