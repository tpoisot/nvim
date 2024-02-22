-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- A lot of the packages will require plenary, so instead of adding it every time, we
    -- just install it once
    use 'nvim-lua/plenary.nvim'

    -- Markdown preview in editor using glow
    use 'ellisonleao/glow.nvim'

    -- neovim has its own LSP, so we will use this one
    use 'neovim/nvim-lspconfig'

    -- LSPSaga is a plugin for the LSP exposing tons of features, including renaming, inline
    -- docs, definition peek, etc
    use 'kkharji/lspsaga.nvim'

    -- We STAN the little lighbulb from VSCode
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    -- Dim inactive windows
    use 'sunjon/shade.nvim'

    -- formatter
    use 'lukas-reineke/lsp-format.nvim'

    -- Rather than scour github for the correct dependencies, we use Mason to automatically
    -- manage everything we need
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Git signs will add very thin lines to the parts of a git tracked file that were
    -- modified
    use 'lewis6991/gitsigns.nvim'

    -- Neogit for in-editor git management
    use 'TimUntersberger/neogit'

    -- Treesitter is a really good code parser and is useful to get to where symbols are
    -- defined
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- We use telescope
    use 'nvim-telescope/telescope.nvim' -- Main telescope plugin
    use 'nvim-telescope/telescope-file-browser.nvim' -- File browser support
    -- TODO: port the scimoji files to gitmoji here
    use 'olacin/telescope-gitmoji.nvim' -- Gitmoji

    -- Quarto
    use 'quarto-dev/quarto-nvim'
    use({
      "quarto-dev/quarto-vim",
       requires = {
          {"vim-pandoc/vim-pandoc-syntax"},
       },
       ft = {"quarto"},
    })

    -- Slime and the slime cells plugin
    use {
        'jpalardy/vim-slime',
        config=function ()
            vim.g.slime_target = "screen"
            vim.g.slime_cell_delimiter = "^\\s*#%%"
            vim.g.slime_default_config = {sessionname="juliarepl", windowname="0"}
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_bracketed_paste = 1
            vim.g.slime_no_mappings = 1
        end
    }

    -- nvim-tree for a file explorer outside of telescope
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        }
    }

    -- vim snip for snippets management
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- nvim-cmp is an autocompletion engine with a lot of support for plugins -- notably, it
    -- does LaTeX character completion, which is cool for julia code
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { "kdheepak/cmp-latex-symbols" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-emoji" },
            { "hrsh7th/cmp-cmdline" },
            { "jc-doyle/cmp-pandoc-references" },
        }
    }

    -- vim-closer for parentheses
    use 'rstacruz/vim-closer'

    -- vim-surround for cool surrounding
    use 'tpope/vim-surround'

    -- Some nice colorschemes
    use 'savq/melange'
    use 'rebelot/kanagawa.nvim'

    -- Carbon images directly from nvim
    use 'ellisonleao/carbon-now.nvim'

    -- Noice for a nice interface
    use {
        "folke/noice.nvim",
        config = function()
            require("noice").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }

    -- We use Trouble to get a nice list of issues, quickfix, etc
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function ()
            require("trouble").setup {
            }
        end
    }

    -- Nice line at the bottom
    use 'nvim-lualine/lualine.nvim'

    -- Indent blank lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- We use todo-comments to have the TODO, PERF etc show up in Telescope and Trouble
    -- (this is nice)
    use {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup {
            }
        end
    }

    -- Comment gives us gcc and gbc for commenting, and is syntax aware, so it's cool
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

end)
