-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.ttimeoutlen = 0
vim.opt.relativenumber = false
-- vim.opt.diffopt:append("vertical")
-- vim.o.shada = "!,'1000,<100,s50,h"

-- Improved version:
-- Make diff mode more readable with vertical splits and better algorithms
vim.opt.diffopt:append({
  "vertical", -- Split diffs vertically
  "algorithm:patience", -- Use patience diff algorithm
  "iwhite", -- Ignore whitespace changes
  "hiddenoff", -- Don't diff hidden buffers
})

-- ShaDa (shared data) settings with explanatory breakdown
vim.o.shada = table.concat({
  "!", -- Save global variables
  "'1000", -- Save marks for 1000 files
  "<100", -- Save register items up to 100 lines each
  "s50", -- Limit size of items in KB
  "h", -- Disable 'hlsearch' when loading
  -- "%", -- Save and restore buffer list
}, ",")

vim.o.clipboard = ""
-- disable LSP log to avoid infinitely growing log file
vim.lsp.set_log_level("off")

-- vim folding
-- ref: https://www.reddit.com/r/neovim/comments/1gi7ush/treesitter_is_amazing/
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

-- for now blink is not working well with codeium
-- ref: https://github.com/LnvimazyVim/LazyVim/discussions/5036#discussioncomment-11560995
-- vim.g.lazyvim_cmp = "nvim-cmp"

-- Animation
-- vim.g.snacks_animate = false
vim.g.snacks_animate_scroll = false
vim.treesitter.language.register("markdown", "vimwiki")

-- Set fold level for HTTP files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    vim.opt_local.foldlevel = 1
  end,
})
