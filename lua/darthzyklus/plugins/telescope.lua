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

        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.95,
                        height = 0.95,
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
            
    end
}
