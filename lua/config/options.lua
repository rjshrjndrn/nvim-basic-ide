-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.clipboard = ""

-- wierd tmux esc-j/k line switch issue fix
-- https://www.reddit.com/r/lunarvim/comments/1334htt/lunarvim_in_tmux_moving_line_up_or_down_when/?share_id=lJ422sSqsq6eyTrQsF1f5&utm_content=2&utm_medium=ios_app&utm_name=ioscss&utm_source=share&utm_term=1
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
