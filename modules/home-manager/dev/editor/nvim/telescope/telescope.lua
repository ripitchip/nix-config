require('telescope').setup({
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
        undo = {
            side_by_side = true,
            layout_strategy = "horizontal",
            layout_config = {
                preview_height = 0.8,
            },
        },
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg",
        },
        live_grep_args = {
            auto_quoting = true,
        },
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('undo')
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('media_files')
require("telescope").load_extension("file_browser")
require("telescope").load_extension('hoogle')
require("telescope").load_extension("live_grep_args")
