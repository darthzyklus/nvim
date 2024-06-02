local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua", "javascript", "rust", "go", "typescript", "python", "html", "css", "sql" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

