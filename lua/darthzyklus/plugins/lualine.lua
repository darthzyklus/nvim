return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local options = {
            theme = 'tokyonight'
        }

        require('lualine').setup({ options })
    end
}
