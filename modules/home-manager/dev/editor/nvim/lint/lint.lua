local lint = require("lint")

local function get_file_name()
	return vim.api.nvim_buf_get_name(0)
end

lint.linters_by_ft = {
	python = { "ruff" },
	c = { "cpplint" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	nix = { "nix" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
