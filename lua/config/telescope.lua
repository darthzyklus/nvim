local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                preview_width = 0.55,
                height = {
                    padding = 0
                },
                width = {
                    padding = 0
                }
            }
        },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            }
        }
    },
    path_display = { "smart" },
    extensions = {
        ['ui-select'] = {
            require("telescope.themes").get_dropdown {
            }
        }
    }
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")


vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
