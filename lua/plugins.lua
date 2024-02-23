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
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("nvim-lightbulb").setup {
                autocmd = { enabled = true }
            }
        end
    },
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
        "rebelot/kanagawa.nvim",
        name = "Kanagawa theme",
        priority = 1000,
        lazy = false,
		config = function()
			vim.cmd([[colorscheme kanagawa]])
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
			{
			"rcarriga/nvim-notify",
				config = function()
					require("notify").setup {
						timeout = 1500,
						render = "minimal",
                        stages = "slide"
					}
				end
				
			}
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
    {
        "folke/twilight.nvim"
    }
})

