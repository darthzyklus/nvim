return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "javascript", "rust", "go", "typescript" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
