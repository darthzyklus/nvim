-- import lspconfig plugin
local lspconfig = require("lspconfig")

-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)   -- show definition, references
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)               -- go to declaration
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)  -- show lsp definitions
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)            -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)      -- show diagnostics for line
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)              -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)              -- jump to next diagnostic in buffer
    keymap.set("n", "K", vim.lsp.buf.hover, opts)                      -- show documentation for what is under cursor
    keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)             -- mapping to restart lsp if necessary
    keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local servers = {
    gopls = {},
    rust_analyzer = {},
    biome = {},
    html = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
    zls = {},
}

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true, -- not the same as ensure_installed
}

mason_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

