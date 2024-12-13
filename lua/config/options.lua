-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.ttimeoutlen = 0
vim.opt.relativenumber = false
vim.opt.diffopt:append("vertical")
vim.o.shada = "!,'1000,<100,s50,h"
vim.o.clipboard = ""
-- disable LSP log to avoid infinitely growing log file
vim.lsp.set_log_level("off")

-- vim folding
-- ref: https://www.reddit.com/r/neovim/comments/1gi7ush/treesitter_is_amazing/
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

-- for now blink is not working well with codeium
-- ref: https://github.com/LazyVim/LazyVim/discussions/5036#discussioncomment-11560995
vim.g.lazyvim_cmp = "nvim-cmp"
