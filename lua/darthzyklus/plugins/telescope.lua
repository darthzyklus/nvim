return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'nvim-treesitter',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }  
    },
    config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
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
           path_display = { "smart" }
        }) 


        telescope.load_extension("fzf")
            

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

    end
}
