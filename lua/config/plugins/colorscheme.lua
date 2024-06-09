return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            transparent = true,         -- Enable this to disable setting the background color
            terminal_colors = true,     -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark",     -- style for sidebars, see below
                floats = "dark",       -- style for floating windows
            },
        })

        vim.cmd([[colorscheme tokyonight-night]])
    end
}
