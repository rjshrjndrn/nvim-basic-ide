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

-- vim-tmux-navigator
if os.getenv("TMUX") then
  keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

-- Comment
keymap({ "n" }, "<Space>/", "<NOP>", opts)
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- FZF
-- keymap("n", "<C-p>", "<cmd>Files<cr>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>h", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)

-- Ferret
keymap("v", "//", [["zy/<C-r>z<cr>]], opts)
keymap("v", "/b", [["zy:Back! <C-r>z<cr>]], opts)
keymap("v", "/B", [["zy:Back! -w <C-r>z<cr>]], opts)
keymap("v", "/S", [["zy:Lack! -w <C-r>z<cr>]], opts)

-- Telescope
keymap("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", opts)

-- Aerial
keymap("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Lazy-Disable
keymap("n", "<leader>l", "", opts)
-- keymap({ "n", "i" }, "<esc>", "<esc>", opts)

--
--
--
--

-- Custom function to goto ansible roles
-- Load Telescope
require("telescope").setup({})

-- Define a custom function to search for roles
function Goto_role()
  -- Get the word under the cursor, considering non-alphanumeric characters
  local word = vim.fn.expand("<cWORD>") -- Use <cWORD> instead of <cword>

  -- Define the roles directory relative to the current file's directory
  local current_file_dir = vim.fn.expand("%:p:h")
  local roles_dir = vim.fn.finddir("roles", current_file_dir .. ";")

  -- If the roles directory is found
  if roles_dir and roles_dir ~= "" then
    require("telescope.builtin").find_files({
      search_dirs = { roles_dir }, -- Set the roles directory to search in
      prompt_title = "< Go to Role >",
      default_text = word, -- Use the word under the cursor as the default search term
    })
  else
    print("Roles directory not found.")
  end
end

-- Map the custom function to a keybinding
vim.api.nvim_set_keymap("n", "<leader>gr", ":lua Goto_role()<CR>", { noremap = true, silent = true })
