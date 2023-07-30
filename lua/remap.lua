vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Custom keymaps
local opts = { noremap = true, silent = true }

-- Move to previous file
vim.keymap.set('', '<leader><Space>', "<c-^>", { desc = "Back to previous file" })

-- Move text up and down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts)

vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)
