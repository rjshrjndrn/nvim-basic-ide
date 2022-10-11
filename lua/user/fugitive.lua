-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("n", "gw", "<cmd>Gwrite<CR>", opts)
keymap("n", "gc", "<cmd>Git commit<CR>", opts)
keymap("n", "gca", "<cmd>Git commit --amend<CR>", opts)
keymap("n", "gs", "<cmd>Git<CR>", opts)
keymap("n", "gp", "<cmd>Git push<CR>", opts)
