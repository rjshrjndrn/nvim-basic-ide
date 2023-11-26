-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
-- Shorten function name
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Tabs
keymap("n", "<S-T>", ":tabnew<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>yy", 'V"+y', opts)
keymap("n", "<leader>Y", '"+y$', opts)
keymap("v", "Y", '"+y', opts)
keymap("n", "<C-Y>", 'magg0"+yG`a', opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)
-- Press jk fast to enter
-- Better delete
-- c-delete to delete word
keymap("i", "<C-H>", "<C-W>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- FZF
keymap("n", "<C-p>", "<cmd>Files<cr>", opts)
keymap("n", "<leader>h", "<cmd>History<cr>", opts)
keymap("n", "<leader>b", ":Buffers<CR>", opts)

-- Ferret
keymap("v", "//", [["zy/<C-r>z<cr>]], opts)
keymap("v", "/b", [["zy:Back! <C-r>z<cr>]], opts)
keymap("v", "/B", [["zy:Back! -w <C-r>z<cr>]], opts)
keymap("v", "/S", [["zy:Lack! -w <C-r>z<cr>]], opts)
