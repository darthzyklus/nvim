local neotest = require("neotest")
neotest.setup({
    adapters = {
        require("neotest-vitest"),
        require("neotest-plenary").setup({}),
        require("neotest-go"),
    }
})

vim.keymap.set("n", "<leader>tc", function()
    neotest.run.run()
end)

vim.keymap.set("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end)

