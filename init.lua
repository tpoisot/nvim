-- This replaces the init.vim file

-- Plugin management
require('plugins')

-- This file contains most of what is usually in init.vim, but expressed using the neovim
-- api. The lua files are all in the lua/ folder
require('settings')

-- Plugin configuration
require("config/git")
require("config/mason")
require("config/cmp")
require("config/carbon")
require("config/nvim-tree")

-- Keybindings
require('keybindings')

-- Lualine
require('lualine').setup()

-- LSP Config
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').julials.setup{}
require('lspconfig').marksman.setup{}
require('lspconfig').cssls.setup{}
require('lsp-format').setup()
require('lspconfig').julials.setup {
    capabilities = capabilities,
    on_attach = require("lsp-format").on_attach
}
require('lspconfig').cssls.setup {
    capabilities = capabilities,
    on_attach = require("lsp-format").on_attach
}
require('lspconfig').marksman.setup {
    capabilities = capabilities,
    on_attach = require("lsp-format").on_attach
}
require('lspconfig').ltex.setup {
    on_attach = on_attach,
    cmd = { "ltex-ls" },
    filetypes = { "markdown", "text", "gitcommit", },
    flags = { debounce_text_changes = 300, checkFrequency = "save" },
}
