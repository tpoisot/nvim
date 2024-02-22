-- General configuration
local g = vim.g
local o = vim.o
local k = vim.keymap
local cmd = vim.api.nvim_command

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- The leader is set to , because it's muscle memory at this point
g.mapleader = ','
g.maplocalleader = ','

-- Colorscheme
o.termguicolors = true
o.background = "dark"

-- Lines above/below the cursor when hitting the bottom of the screen
o.scrolloff = 8

-- Some editor UI to make the line number column look nice
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.cursorline = true

-- editor experience
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.cindent = true
o.wrap = true
o.textwidth = 92
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1
o.list = true
o.formatoptions = 'qrn1'

-- system clipboard
o.clipboard = 'unnamedplus'

-- Case insensitive search
o.ignorecase = true
o.smartcase = true

-- Backup (no)
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- History (50 items)
o.history = 50

-- Splitting
o.splitright = true
o.splitbelow = true

-- Auto-complete
o.completeopt=menu,menuone,noselect
