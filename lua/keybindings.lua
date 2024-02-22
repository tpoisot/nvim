local tb = require("telescope.builtin")
local te = require("telescope").extensions

-- Telescope
vim.keymap.set('n', '<leader>ff', tb.find_files, {})
vim.keymap.set('n', '<leader>fb', te.file_browser.file_browser, {})

-- Gitmoji and Neogit
vim.keymap.set('n', '<leader>ng', ":Neogit<CR>", {})

-- Carbon
vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { noremap = true, silent = true })

-- nvim-tree
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", {})

-- LSP
vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", {})
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", {})
vim.keymap.set("n", "<leader>hd", ":Lspsaga hover_doc<CR>", {})
vim.keymap.set("n", "<leader>pd", ":Lspsaga preview_definition<CR>", {})
vim.keymap.set("n", "<leader>lf", ":Lspsaga lsp_finder<CR>", {})
vim.keymap.set("n", "<leader>sw", ":Telescope lsp_workspace_symbols<CR>", {})
vim.keymap.set("n", "<leader>ds", ":Telescope lsp_dynamic_workspace_symbols<CR>", {})
vim.keymap.set("n", "<leader>sd", ":Telescope lsp_document_symbols<CR>", {})

-- Markdown preview
vim.keymap.set("n", "<leader>mp", ":Glow<CR>", {})

-- nohl
vim.keymap.set("n", "<leader><space>", ":nohl<CR>", {})

-- Splits!
vim.keymap.set("n", "<leader>sv", ":vsp<CR>", {}) -- Make a new column
vim.keymap.set("n", "<leader>sh", ":sp<CR>", {})  -- Make a new row
vim.keymap.set("n", "<leader>h", "<C-w>h", {})
vim.keymap.set("n", "<leader>j", "<C-w>j", {})
vim.keymap.set("n", "<leader>k", "<C-w>k", {})
vim.keymap.set("n", "<leader>l", "<C-w>l", {})

-- Twilight
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>", {})
