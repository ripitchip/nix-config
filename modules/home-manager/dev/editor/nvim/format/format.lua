local conform = require("conform")

conform.setup({
	formatters_by_ft = {

		python = { "black", "ruff" },
		rust = { "rustfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		csharp = { "csharpier" },

		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		svelte = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },

		json = { "prettierd" },
		yaml = { "prettierd" },

		markdown = { "prettierd" },
		vimwiki = { "prettierd" },
		graphql = { "prettierd" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		tex = { "latexindent" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
