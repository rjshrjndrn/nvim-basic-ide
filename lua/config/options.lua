-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.ttimeoutlen = 0
vim.opt.relativenumber = false
vim.opt.diffopt:append("vertical")
vim.o.shada = "!,'1000,<100,s50,h"
vim.o.clipboard = ""
