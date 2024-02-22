-- This replaces the init.vim file

-- lazy.nvim package management 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy plugin config
require("lazy").setup({
	"folke/which-key.nvim",
	"nvim-lua/plenary.nvim",
	"ellisonleao/glow.nvim",
	"neovim/nvim-lspconfig",
	"kkharji/lspsaga.nvim",
	"antoinemadec/FixCursorHold.nvim",
	"kosayoda/nvim-lightbulb",
	"sunjon/shade.nvim",
	"lukas-reineke/lsp-format.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"lewis6991/gitsigns.nvim",
	"TimUntersberger/neogit",
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "julia",
                    "markdown",
                    "css",
                    "html",
                    "bibtex",
                    "json"
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true
                }
            }
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            require("telescope").load_extension "file_browser"
        end
    },
	"nvim-tree/nvim-tree.lua",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"kdheepak/cmp-latex-symbols",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"jc-doyle/cmp-pandoc-references",
		}
	},
	"rstacruz/vim-closer",
	"tpope/vim-surround",
    {
        "folke/tokyonight.nvim",
        name = "Tokyo Night theme",
        priority = 1000,
        lazy = false,
		config = function()
			vim.cmd([[colorscheme tokyonight-moon]])
		end
    },
	"ellisonleao/carbon-now.nvim",
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		}
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup()
		end
	},
	"nvim-lualine/lualine.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
    {
        "Olical/conjure"
    },
})

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
