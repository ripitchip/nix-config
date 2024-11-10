------------------------TELESCOPE------------------------
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
