local opts = { noremap = true, silent = true }

-- Move text up and down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts)

vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Move and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move to previous buffer
vim.keymap.set("", "<leader><leader>", "<c-^>", opts)
